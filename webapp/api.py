#!/usr/bin/env python3
'''
    example_flask_app.py
    Jeff Ondich, 22 April 2016

    A slightly more complicated Flask sample app than the
    "hello world" app found at http://flask.pocoo.org/.
'''
import sys
import flask
import json
import psycopg2
import random

app = flask.Flask(__name__)

database = "padillac3"
user = "padillac3"
password = "ruby287ruby"

try:
    connection = psycopg2.connect(database=database, user=user, password=password)
except Exception as e:
    print(e)
    exit()


@app.route('/')
def hello():
    return 'Hello, Citizen of CS257.'



@app.route('/random')
def get_random():
    random_respondent = []

    def try_random_id():
        try:
            id = random.randint(4335894916, 4337954960)

            query = "SELECT DISTINCT main_food.id, main_dish, cranberry_sauce, cooked, stuffing, pray, region, income, travel, black_friday_shop, work_retail, work_black_friday, gravy, population_density, gender, age, friendsgiving, age_cutoff FROM main_food, side_dish, pie, dessert, demographics WHERE main_food.id = {0} AND side_dish.id = {0} AND pie.id = {0} AND dessert.id = {0} AND demographics.id = {0}".format(id)

            cursor = connection.cursor()
            cursor.execute(query)
            return cursor.fetchall()
        except Exception as e:
            print(e)
            exit()

    while random_respondent == []:
        random_respondent = try_random_id()


    #TODO MAKE DICTIONARY HERE WITH random_respondent RESULTS

    return json.dumps(random_respondent)

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print('Usage: {0} host port'.format(sys.argv[0]))
        print('  Example: {0} perlman.mathcs.carleton.edu 5101'.format(sys.argv[0]))
        exit()

    host = sys.argv[1]
    port = int(sys.argv[2])
    app.run(host=host, port=port, debug=True)
