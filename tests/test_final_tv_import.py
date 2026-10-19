import csv
import importlib.util
import json
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('final_tv', ROOT / 'scripts/prepare-final-tv-import.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)


class FinalImportTest(unittest.TestCase):
    def setUp(self):
        with (ROOT / 'imports/personal-ratings-cleaned.csv').open(encoding='utf-8-sig') as handle:
            self.source = {row['source_rows']: row for row in csv.DictReader(handle)}
        self.catalogue = json.loads((ROOT / 'tv-catalog.js').read_text().split(' = ', 1)[1].strip().removesuffix(';'))
        self.plan = json.loads((ROOT / 'imports/remaining-version-decisions.json').read_text())

    def test_nine_sources_become_eight_exact_scoped_ratings(self):
        result, audit = module.proposal(self.source, self.catalogue, self.plan)
        self.assertFalse(result['replace_dekalog_episode'])
        actual = {row['work_key']: row['rating'] for row in result['ratings']}
        self.assertEqual(actual, {'tv:99952': 6.5, 'tv:1455:season:1': 7,
            'tv:1455:season:2': 6.5, 'tv:movie:126850': 8.5, 'tv:movie:126846': 8,
            'tv:movie:126854': 8, 'tv:imdb:tt4324832': 7.5,
            'tv:local:good-night-little-ones-tatarskiy-opening': 7})
        self.assertEqual(len(audit), 8)
        self.assertTrue(all(row['watched_date'] is None for row in result['ratings']))

    def test_conflicting_part_scores_or_notes_require_review(self):
        for field, value in [('rating', '7'), ('rating', '6.25'), ('notes', 'part-specific note')]:
            with self.subTest(field=field, value=value):
                source = {key: dict(row) for key, row in self.source.items()}
                source['1276'][field] = value
                with self.assertRaises(ValueError):
                    module.proposal(source, self.catalogue, self.plan)

    def test_source_drift_or_repeated_rows_fail(self):
        self.source['1457']['source_title'] = 'Different sequel'
        with self.assertRaises(ValueError):
            module.proposal(self.source, self.catalogue, self.plan)

    def test_individual_notes_are_preserved(self):
        self.source['1710']['notes'] = 'My original note'
        result, _ = module.proposal(self.source, self.catalogue, self.plan)
        self.assertEqual(next(row['notes'] for row in result['ratings'] if row['work_key'] == 'tv:movie:126850'), 'My original note')
