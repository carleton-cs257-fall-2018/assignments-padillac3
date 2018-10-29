#!/usr/bin/env python3
'''
    api.py
    Chris Padilla and Yasmeen Awad

'''
import sys
import flask
import json
import psycopg2
import random
import requests

app = flask.Flask(__name__, static_folder='static', template_folder='templates')

database = "padillac3"
user = "padillac3"
password = "ruby287ruby"

try:
    connection = psycopg2.connect(database=database, user=user, password=password)
except Exception as e:
    print(e)
    exit()


@app.after_request
def set_headers(response):
    response.headers['Access-Control-Allow-Origin'] = '*'
    return response

@app.route('/')
def hello():
    return 'Hello, Citizen of CS257.'


@app.route('/map')
def get_stats():
    data = []

    #TODO MAKE SURE '/' CHARACTERS DO NOT END UP IN ARGS WHEN ARGS ARE AT THE END OF THE URL

    demographic = flask.request.args.get('demographic')
    interest = flask.request.args.get('interest')

    # Check for valid keyword arguments
    if demographic not in ['region', 'population_density', 'age', 'gender', 'income']:
        return '404 error: bad demographic argument'

    if interest not in ['main_dish', 'cooked', 'stuffing', 'cranberry_sauce', 'gravy',
                'side', 'pie_type', 'dessert_type', 'pray', 'travel', 'macys_parade',
                'age_cutoff', 'friendsgiving', 'black_friday_shop', 'work_retail', 'work_black_friday']:
        return '404 error: bad interest argument'


    if interest =='pie_type':
        table_name = 'pie'
    elif interest == 'dessert_type':
        table_name = 'dessert'
    elif interest == 'side':
        table_name = 'side_dish'
    elif interest in ('main_dish', 'cranberry_sauce', 'cooked', 'gravy', 'stuffing'):
        table_name = 'main_food'
    else:
        table_name = ''


    try:
        if table_name == '':
            query = "SELECT  DISTINCT {1}, {0}, COUNT({0}) FROM demographics GROUP BY {0}, {1}".format(interest, demographic, table_name)
        else:
            query = "SELECT  DISTINCT {1}, {0}, COUNT({0}) FROM {2}, demographics WHERE {2}.id = demographics.id GROUP BY {0}, {1}".format(interest, demographic, table_name)

        cursor = connection.cursor()
        cursor.execute(query)

    except Exception as e:
        print(e)
        exit()

    data = cursor.fetchall()

    return json.dumps(data)



@app.route('/random/')
def get_random():
    random_respondent = []

    def try_random_id():
        try:
            id = random.randint(4335894916, 4337954960)

            query = "SELECT DISTINCT main_food.id, main_dish, cranberry_sauce, cooked, stuffing, pray, region, income, travel, black_friday_shop, work_retail, work_black_friday, gravy, population_density, gender, age, friendsgiving, age_cutoff FROM main_food, side_dish, pie, dessert, demographics WHERE main_food.id = {0} AND side_dish.id = {0} AND pie.id = {0} AND dessert.id = {0} AND demographics.id = {0}".format(id)
            cursor = connection.cursor()
            cursor.execute(query)


            side_query = "SELECT side FROM side_dish WHERE id = {0}".format(id)
            side_cursor = connection.cursor()
            side_cursor.execute(side_query)

            pie_query = "SELECT pie_type FROM pie WHERE id = {0}".format(id)
            pie_cursor = connection.cursor()
            pie_cursor.execute(pie_query)

            dessert_query = "SELECT dessert_type FROM dessert WHERE id = {0}".format(id)
            dessert_cursor = connection.cursor()
            dessert_cursor.execute(dessert_query)

            return cursor.fetchall(), side_cursor.fetchall(), pie_cursor.fetchall(), dessert_cursor.fetchall()
        except Exception as e:
            print(e)
            exit()

    while random_respondent == []:
        random_respondent, side_data, pie_data, dessert_data = try_random_id()

    random_respondent.append(side_data)
    random_respondent.append(pie_data)
    random_respondent.append(dessert_data)

    r = requests.get("https://randomapi.com/api/6de6abfedb24f889e0b5f675edc50deb?fmt=raw&sole")
    random_first_name = r.json()[0]['first']
    random_last_name = r.json()[0]['last']

    random_respondent.append(random_first_name)
    random_respondent.append(random_last_name)

    #TODO MAKE DICTIONARY HERE WITH random_respondent RESULTS

    id = random_respondent[0][0]
    main_dish = random_respondent[0][1]
    cranberry_sauce = random_respondent[0][2]
    cooked = random_respondent[0][3]
    stuffing = random_respondent[0][4]
    pray = random_respondent[0][5]
    region = random_respondent[0][6]
    income = random_respondent[0][7]
    travel = random_respondent[0][8]
    black_friday_shop = random_respondent[0][9]
    work_retail = random_respondent[0][10]
    work_black_friday = random_respondent[0][11]
    gravy = random_respondent[0][12]
    population_density = random_respondent[0][13]
    gender = random_respondent[0][14]
    age = random_respondent[0][15]
    friendsgiving = random_respondent[0][16]
    age_cutoff = random_respondent[0][17]

    side_list = random_respondent[1]
    side = []
    for option in side_list:
        side.append(option[0])

    pie_list = random_respondent[2]
    pie = []
    for pie_type in pie_list:
        pie.append(pie_type[0])

    dessert_list = random_respondent[3]
    dessert = []
    for dessert_type in dessert_list:
        dessert.append(dessert_type[0])

    first_name = random_respondent[4]
    last_name = random_respondent[5]

    random_response = {'id': id, 'main_dish': main_dish, 'cranberry_sauce': cranberry_sauce,
            'cooked': cooked, 'stuffing': stuffing, 'pray': pray, 'region': region, 'income': income,
            'travel': travel, 'black_friday_shop': black_friday_shop, 'work_retail': work_retail,
            'work_black_friday': work_black_friday, 'gravy': gravy,
            'population_density': population_density, 'gender': gender, 'age': age,
            'friendsgiving': friendsgiving, 'age_cutoff': age_cutoff, 'side': side, 'pie': pie,
            'first_name': first_name, 'last_name': last_name}

    return json.dumps(random_response)







if __name__ == '__main__':
    if len(sys.argv) != 3:
        print('Usage: {0} host port'.format(sys.argv[0]))
        print('  Example: {0} perlman.mathcs.carleton.edu 5101'.format(sys.argv[0]))
        exit()

    host = sys.argv[1]
    port = int(sys.argv[2])
    app.run(host=host, port=port, debug=True)
