# Chris Padilla and Yasmeen Awad

import unittest
import requests
import json

class api_test(unittest.TestCase):

    def setUp(self):
        pass

    def tearDown(self):
        request = None

    def test_random(self):
        request = requests.get("http://perlman.mathcs.carleton.edu:5101/random/")
        unittest.assertEqual(len(json.loads(request.json())), 21)

    def test_region_main_dish(self):
        request = requests.get("http://perlman.mathcs.carleton.edu:5101/home?demographic=region&interest=main_dish/")
        unittest.assertEqual(json.loads(request.json()), {'Pacific': {'turkey': .9, 'tofurkey': .05, 'ham/pork': .04, 'turducken': 0, 'roast beef': 0, 'chicken': 0 'other': .01},
'West North Central': {'turkey': .9, 'tofurkey': .05, 'ham/pork': .04, 'turducken': 0, 'roast beef': 0, 'chicken': 0 'other': .01},
'Southeast': {'turkey': .9, 'tofurkey': .05, 'ham/pork': .04, 'turducken': 0, 'roast beef': 0, 'chicken': 0 'other': .01},
'Middle Atlantic': {'turkey': .9, 'tofurkey': .05, 'ham/pork': .04, 'turducken': 0, 'roast beef': 0, 'chicken': 0 'other': .01},
'East South Central': {'turkey': .9, 'tofurkey': .05, 'ham/pork': .04, 'turducken': 0, 'roast beef': 0, 'chicken': 0 'other': .01},
'Mountain': {'turkey': .9, 'tofurkey': .05, 'ham/pork': .04, 'turducken': 0, 'roast beef': 0, 'chicken': 0 'other': .01},
'East North Central': {'turkey': .9, 'tofurkey': .05, 'ham/pork': .04, 'turducken': 0, 'roast beef': 0, 'chicken': 0 'other': .01},
'New England': {'turkey': .9, 'tofurkey': .05, 'ham/pork': .04, 'turducken': 0, 'roast beef': 0, 'chicken': 0 'other': .01},
'South Atlantic': {'turkey': .9, 'tofurkey': .05, 'ham/pork': .04, 'turducken': 0, 'roast beef': 0, 'chicken': 0 'other': .01},
'West South Central': {'turkey': .9, 'tofurkey': .05, 'ham/pork': .04, 'turducken': 0, 'roast beef': 0, 'chicken': 0 'other': .01},
})

    def test_gender_side_dish(self):
        request = requests.get("http://perlman.mathcs.carleton.edu:5101/home?demographic=gender&interest=side_dish/")
        unittest.assertEqual(json.loads(request.json()), {'Male': {'brussel sprouts': 0, 'carrots': 0,
        'cauliflower': 0, 'corn': 0, 'cornbread': 0, 'fruit salad': 0, 'green beans/grean bean casserole': 0,
        'maraconi and cheese': 0, 'mashed potatoes': 0, 'rolls/buscuits': 0, 'squash': 0, 'vegetable salad': 0,
        'yams/sweet potato casserole': 0, 'other': 0}},
        'Female': {'brussel sprouts': 0, 'carrots': 0,
        'cauliflower': 0, 'corn': 0, 'cornbread': 0, 'fruit salad': 0, 'green beans/grean bean casserole': 0,
        'maraconi and cheese': 0, 'mashed potatoes': 0, 'rolls/buscuits': 0, 'squash': 0, 'vegetable salad': 0,
        'yams/sweet potato casserole': 0, 'other': 0},
        'Other': {'brussel sprouts': 0, 'carrots': 0,
        'cauliflower': 0, 'corn': 0, 'cornbread': 0, 'fruit salad': 0, 'green beans/grean bean casserole': 0,
        'maraconi and cheese': 0, 'mashed potatoes': 0, 'rolls/buscuits': 0, 'squash': 0, 'vegetable salad': 0,
        'yams/sweet potato casserole': 0, 'other': 0}
        })

    def test_age_group_pie(self):
        request = requests.get("http://perlman.mathcs.carleton.edu:5101/home?demographic=age_group&interest=pie")
        unittest.assertEqual(json.loads(request.json()), {'18-29': {'pumpkin': 0, 'apple': 0, 'buttermilk': 0,
        'cherry': 0, 'chocolate': 0, 'coconut cream': 0, 'key lime': 0, 'peach': 0, 'pecan': 0,
        'sweet potato': 0, 'none': 0 , 'other': 0},
        '30-44': {'pumpkin': 0, 'apple': 0, 'buttermilk': 0,
        'cherry': 0, 'chocolate': 0, 'coconut cream': 0, 'key lime': 0, 'peach': 0, 'pecan': 0,
        'sweet potato': 0, 'none': 0 , 'other': 0}
        '45-59': {'pumpkin': 0, 'apple': 0, 'buttermilk': 0,
        'cherry': 0, 'chocolate': 0, 'coconut cream': 0, 'key lime': 0, 'peach': 0, 'pecan': 0,
        'sweet potato': 0, 'none': 0 , 'other': 0}
        '60+': {'pumpkin': 0, 'apple': 0, 'buttermilk': 0,
        'cherry': 0, 'chocolate': 0, 'coconut cream': 0, 'key lime': 0, 'peach': 0, 'pecan': 0,
        'sweet potato': 0, 'none': 0 , 'other': 0}
        })

    def test_population_density_dessert(self):
        request = requests.get("http://perlman.mathcs.carleton.edu:5101/home?demographic=population_density&interest=dessert")
        unittest.assertEqual(json.loads(request.json()), {'urban': {'apple cobbler': 0, 'blondies': 0,
        'brownies': 0, 'carrot cake': 0, 'cheesecake': 0, 'cookies': 0, 'fudge': 0, 'ice cream': 0,
        'peach cobbler': 0, 'none': 0, 'other': 0},
        'suburban': {'urban': {'apple cobbler': 0, 'blondies': 0,
        'brownies': 0, 'carrot cake': 0, 'cheesecake': 0, 'cookies': 0, 'fudge': 0, 'ice cream': 0,
        'peach cobbler': 0, 'none': 0, 'other': 0},
        'rural': {'urban': {'apple cobbler': 0, 'blondies': 0,
        'brownies': 0, 'carrot cake': 0, 'cheesecake': 0, 'cookies': 0, 'fudge': 0, 'ice cream': 0,
        'peach cobbler': 0, 'none': 0, 'other': 0}
        })
