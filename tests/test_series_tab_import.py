import copy,importlib.util,json,unittest
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('series',ROOT/'scripts/prepare-series-tab-import.py');module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
class SeriesImportTest(unittest.TestCase):
    def setUp(self):
        self.decisions={'entries':[{'source_query':'Disclaimer','source_rows':'50','show_key':'tv:147050','season_one_is_whole_miniseries':True},{'source_query':'Squid Game','source_rows':'73','show_key':'tv:93405','season_one_is_whole_miniseries':False},{'source_query':'Black Mirror','source_rows':'87','show_key':'tv:42009','season_one_is_whole_miniseries':False}]}
        self.source={'entries':[{'source_row':50,'source_title':'Disclaimer','query':'Disclaimer','season_number':None,'rating':7.5,'notes':''},{'source_row':73,'source_title':'Squid Game, s1','query':'Squid Game','season_number':1,'rating':8,'notes':'Original note'},{'source_row':87,'source_title':'Black Mirror','query':'Black Mirror','season_number':None,'rating':None,'notes':''}]}
        self.existing={'ratings':[{'work_key':'tv:147050','rating':7,'notes':'Existing personal note'},{'work_key':'tv:93405','rating':7.5,'notes':''}]}
        self.catalogue=[{'id':'tv:147050','series_kind':'miniseries'},{'id':'tv:93405:season:1','series_kind':'season'},{'id':'tv:42009','series_kind':'series'}]
    def test_preserves_scopes_unrated_rows_and_explicitly_reviews_conflict(self):
        proposal,audit,summary=module.build(self.source,self.existing,self.decisions,self.catalogue)
        self.assertEqual(proposal['format'],'culture-atlas-tv-progress-v2')
        self.assertEqual(proposal['rating_corrections'],[{'work_key':'tv:147050','expected_rating':7,'rating':7.5}])
        self.assertEqual(proposal['ratings'][1],{'work_key':'tv:93405:season:1','rating':8,'rating_scope':'whole_work','notes':'Original note','watched_date':None})
        self.assertEqual(summary['outcomes']['unrated_catalogue_only'],1);self.assertEqual(summary['expected_tv_ratings'],3)
        self.assertEqual(self.existing['ratings'][1]['rating'],7.5)
    def test_unreviewed_score_conflict_aborts(self):
        self.existing['ratings'][0]['rating']=6.5
        with self.assertRaises(ValueError):module.build(self.source,self.existing,self.decisions,self.catalogue)
    def test_duplicate_source_target_aborts(self):
        self.source['entries'].append(copy.deepcopy(self.source['entries'][1]))
        with self.assertRaises(ValueError):module.build(self.source,self.existing,self.decisions,self.catalogue)
    def test_single_season_miniseries_resolves_to_same_existing_work(self):
        self.source['entries'][0]['season_number']=1;self.existing['ratings'][0]['rating']=7.5
        proposal,audit,summary=module.build(self.source,self.existing,self.decisions,self.catalogue)
        self.assertEqual(proposal['ratings'][0]['work_key'],'tv:147050');self.assertEqual(proposal['rating_corrections'],[])
