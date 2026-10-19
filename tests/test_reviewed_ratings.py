"""Safety checks for offline, insert-only rating planning."""
import importlib.util
import unittest
from pathlib import Path

SPEC = importlib.util.spec_from_file_location('reviewed', Path(__file__).resolve().parents[1] / 'scripts/prepare-reviewed-ratings.py')
MODULE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MODULE)


class ReviewedRatingsTests(unittest.TestCase):
    def fixture(self, rating='7.5', year='2026'):
        source = [{'source_rows': '2', 'source_title': 'Example', 'source_year': year, 'rating': rating, 'notes': ''}]
        ledger = [{'source_rows': '2', 'source_title': 'Example', 'source_year': year, 'work_type': 'movie',
                   'coverage_status': 'present', 'catalogue_id': '2178', 'work_key': 'movie:2178',
                   'tmdb_id': '41225', 'imdb_id': 'tt0063715', 'identity_review_required': 'false'}]
        films = [{'id': 2178, 'tmdb_id': 41225, 'imdb_id': 'tt0063715', 'title': 'Example'}]
        return source, ledger, films

    def test_no_export_is_never_ready_and_current_year_is_allowed(self):
        result = MODULE.prepare(*self.fixture())
        self.assertEqual(result['film_decisions'][0]['decision'], 'needs_current_progress_export')
        self.assertEqual(result['film_decisions'][0]['rating'], 7.5)

    def test_only_absent_progress_becomes_insert_candidate(self):
        self.assertEqual(MODULE.prepare(*self.fixture(), progress={})['film_decisions'][0]['decision'], 'missing_insert_candidate_after_review')
        for rating, watched, decision in [(7.5, True, 'already_present_no_write'), (8, True, 'existing_progress_conflict_no_write'), (None, False, 'existing_progress_conflict_no_write')]:
            progress = {2178: {'rating': rating, 'watched': watched, 'notes': '', 'watched_date': '2020-01-01'}}
            result = MODULE.prepare(*self.fixture(), progress=progress)['film_decisions'][0]
            self.assertEqual(result['decision'], decision)
            self.assertEqual(progress[2178]['watched_date'], '2020-01-01')

    def test_tv_is_not_inserted_into_film_progress(self):
        source, ledger, films = self.fixture()
        ledger[0].update(work_type='tv', catalogue_id='tv:41225', work_key='tv:41225', coverage_status='present_tv_catalogue')
        result = MODULE.prepare(source, ledger, films, {})
        self.assertEqual(result['film_decisions'], [])
        self.assertEqual(result['summary']['held_source_entries'], 1)

    def test_conflicting_source_ratings_stay_separate(self):
        source, ledger, films = self.fixture()
        source.append(dict(source[0], source_rows='3', rating='8'))
        ledger.append(dict(ledger[0], source_rows='3'))
        result = MODULE.prepare(source, ledger, films, {})['film_decisions'][0]
        self.assertEqual(result['decision'], 'source_rating_conflict_no_write')
        self.assertNotIn('rating', result)
        self.assertEqual(len(result['source_entries']), 2)

    def test_reuses_exact_prior_decision_but_rejects_changed_scores(self):
        source, ledger, films = self.fixture(rating='7')
        films[0]['tmdb_id'] = 49519
        ledger[0]['tmdb_id'] = '49519'
        source.append(dict(source[0], source_rows='3', rating='6.5'))
        ledger.append(dict(ledger[0], source_rows='3'))
        result = MODULE.prepare(source, ledger, films, {})['film_decisions'][0]
        self.assertEqual(result['rating'], 6.5)
        source[1]['rating'] = '8'
        self.assertEqual(MODULE.prepare(source, ledger, films, {})['film_decisions'][0]['decision'], 'source_rating_conflict_no_write')

    def test_bad_snapshot_and_identity_drift_fail_closed(self):
        row = {'film_id': '1', 'watched': 'true', 'rating': '7.5', 'user_id': 'a'}
        for rows in [[row, row], [row, dict(row, film_id='2', user_id='b')], [dict(row, rating='NaN')]]:
            with self.assertRaises(ValueError):
                MODULE.progress_rows(rows)
        source, ledger, films = self.fixture()
        ledger[0]['tmdb_id'] = '123'
        with self.assertRaises(ValueError):
            MODULE.prepare(source, ledger, films)


if __name__ == '__main__':
    unittest.main()
