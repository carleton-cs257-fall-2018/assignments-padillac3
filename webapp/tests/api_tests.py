# Chris Padilla and Yasmeen Awad
# 10/15/18
# Api Tests

import unittest
import requests
import json

class api_test(unittest.TestCase):
# Make sure the API is running before running this module, or all the tests will fail.

    def setUp(self):
        # As long as the API is running, there should be no set-up required.
        pass


    def tearDown(self):
        request = None


    def test_random(self):

        request = requests.get("http://perlman.mathcs.carleton.edu:5101/random/")
        unittest.assertEqual(len(json.loads(request.json())), 21)


    def test_region_main_dish(self):

        request = requests.get("http://perlman.mathcs.carleton.edu:5101/home?demographic=region&interest=main_dish/")

        unittest.assertEqual(json.loads(request.json()), {'Pacific': {'turkey': .89, 'tofurkey': .01,
        'ham/pork': .04, 'turducken': .01, 'roast beef': .01, 'chicken': .02 'other': .02},

        'West North Central': {'turkey': .9, 'tofurkey': .05, 'ham/pork': .04, 'turducken': 0,
        'roast beef': 0, 'chicken': 0 'other': .01},

        'Southeast': {'turkey': .95, 'tofurkey': 0, 'ham/pork': .04, 'turducken': .01,
        'roast beef': .01, 'chicken': 0 'other': .01},

        'Middle Atlantic': {'turkey': .9, 'tofurkey': 0, 'ham/pork': .03, 'turducken': .01,
        'roast beef': 0, 'chicken': 0 'other': 0},

        'East South Central': {'turkey': .88, 'tofurkey': .02, 'ham/pork': .04, 'turducken': .02,
        'roast beef': .01, 'chicken': 0 'other': 0},

        'Mountain': {'turkey': .91, 'tofurkey': .01, 'ham/pork': .01, 'turducken': 0,
        'roast beef': .01, 'chicken': .02 'other': .01},

        'East North Central': {'turkey': .9, 'tofurkey': 0, 'ham/pork': .04, 'turducken': 0,
        'roast beef': 0, 'chicken': 0 'other': 0},

        'New England': {'turkey': .9, 'tofurkey': .04, 'ham/pork': .04, 'turducken': 0,
        'roast beef': 0, 'chicken': 0 'other': 0},

        'South Atlantic': {'turkey': .9, 'tofurkey': 0, 'ham/pork': .02, 'turducken': .01,
        'roast beef': .01, 'chicken': 0 'other': .02},

        'West South Central': {'turkey': .91, 'tofurkey': .01, 'ham/pork': .03, 'turducken': 0,
        'roast beef': .01, 'chicken': 0 'other': .01},

        })


    def test_gender_side_dish(self):

        request = requests.get("http://perlman.mathcs.carleton.edu:5101/home?demographic=gender&interest=side_dish/")

        unittest.assertEqual(json.loads(request.json()), {'Male': {'brussel sprouts': .67, 'carrots': .3,
        'cauliflower': .44, 'corn': .9, 'cornbread': .87, 'fruit salad': .13, 'green beans/grean bean casserole': .25,
        'maraconi and cheese': .11, 'mashed potatoes': .99, 'rolls/buscuits': .93, 'squash': .64, 'vegetable salad': .22,
        'yams/sweet potato casserole': .5, 'other': .43}},

        'Female': {'brussel sprouts': .66, 'carrots': .32, 'cauliflower': .51, 'corn': .88, 'cornbread': .9,
        'fruit salad': .11, 'green beans/grean bean casserole': .33, 'maraconi and cheese': .1, 'mashed potatoes': .99,
        'rolls/buscuits': 95, 'squash': .64, 'vegetable salad': .2, 'yams/sweet potato casserole': .5, 'other': .31},

        'Other': {'brussel sprouts': .25, 'carrots': 0, 'cauliflower': .5, 'corn': .75, 'cornbread': 1,
        'fruit salad': 0, 'green beans/grean bean casserole': .5, 'maraconi and cheese': 0, 'mashed potatoes': 1,
        'rolls/buscuits': 1, 'squash': .75, 'vegetable salad': 0, 'yams/sweet potato casserole': .5, 'other': .75}

        })


    def test_age_group_pie(self):

        request = requests.get("http://perlman.mathcs.carleton.edu:5101/home?demographic=age_group&interest=pie")

        unittest.assertEqual(json.loads(request.json()), {'18-29': {'pumpkin': .7, 'apple': .2, 'buttermilk': .02,
        'cherry': .05, 'chocolate': .09, 'coconut cream': .01, 'key lime': 0, 'peach': .02, 'pecan': .3,
        'sweet potato': .03, 'none': .21 , 'other': .11},

        '30-44': {'pumpkin': .73, 'apple': .32, 'buttermilk': .01, 'cherry': .12, 'chocolate': .01,
        'coconut cream': .02, 'key lime': .01, 'peach': .11, 'pecan': .21,'sweet potato': .05, 'none': .12, 'other': .2},

        '45-59': {'pumpkin': .71, 'apple': .32, 'buttermilk': .03, 'cherry': .1, 'chocolate': .02,
        'coconut cream': 0, 'key lime': .03, 'peach': .11, 'pecan': .21,'sweet potato': .05, 'none': .08, 'other': .32},

        '60+': {'pumpkin': .8, 'apple': .3, 'buttermilk': .02, 'cherry': .09, 'chocolate': .03,
        'coconut cream': .01, 'key lime': 0, 'peach': .21, 'pecan': .21,'sweet potato': .05, 'none': .04, 'other': .12},

        })


    def test_population_density_dessert(self):

        request = requests.get("http://perlman.mathcs.carleton.edu:5101/home?demographic=population_density&interest=dessert")

        unittest.assertEqual(json.loads(request.json()), {'urban': {'apple cobbler': .71, 'blondies': .22,
        'brownies': .3, 'carrot cake': .23, 'cheesecake': .04, 'cookies': .72, 'fudge': .14, 'ice cream': .53,
        'peach cobbler': .73, 'none': .07, 'other': .3},

        'suburban': {'apple cobbler': .69, 'blondies': .45, 'brownies': .53, 'carrot cake': .25, 'cheesecake': .16,
        'cookies': .73, 'fudge': .24, 'ice cream': .55,'peach cobbler': .8, 'none': .04, 'other': .09},

        'rural': {'apple cobbler': .65, 'blondies': .33, 'brownies': .42, 'carrot cake': .37, 'cheesecake': .15,
        'cookies': .66, 'fudge': .35, 'ice cream': .87, 'peach cobbler': .43, 'none': .09, 'other': .11}

        })
