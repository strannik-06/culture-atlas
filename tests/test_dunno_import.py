import importlib.util
from pathlib import Path
import unittest

spec = importlib.util.spec_from_file_location('dunno', Path(__file__).resolve().parents[1] / 'scripts/prepare-dunno-tv-import.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)


class DunnoImportTest(unittest.TestCase):
    def setUp(self):
        self.source = {'1276': {'source_title': 'Незнайка на Луне 2', 'source_year': '1999', 'rating': '6.5', 'notes': ''},
                       '1359': {'source_title': 'Незнайка на Луне', 'source_year': '1997', 'rating': '6.5', 'notes': ''}}
        self.catalogue = [{'id': 'tv:99952', 'tmdb_id': 99952, 'imdb_id': 'tt0219207'}]

    def test_combines_equal_part_scores_once_without_dekalog_or_date(self):
        result = module.proposal(self.source, self.catalogue)
        self.assertFalse(result['replace_dekalog_episode'])
        self.assertEqual(result['ratings'], [{'work_key': 'tv:99952', 'rating': 6.5,
                                              'rating_scope': 'whole_work', 'notes': '', 'watched_date': None}])

    def test_conflicting_scores_or_notes_require_review(self):
        for field, value in [('rating', '7'), ('rating', '6.25'), ('notes', 'part-specific note')]:
            with self.subTest(field=field, value=value):
                source = {key: dict(row) for key, row in self.source.items()}
                source['1276'][field] = value
                with self.assertRaises(ValueError):
                    module.proposal(source, self.catalogue)

    def test_changed_external_identity_requires_review(self):
        self.catalogue[0]['imdb_id'] = 'tt0000001'
        with self.assertRaises(ValueError):
            module.proposal(self.source, self.catalogue)
