#API Test Program
# Chris Padilla and Yasmeen Awad 10/1/18

import sys
import json
import urllib.request


def get_countries():

    url = 'https://restcountries.eu/rest/v2/'
    data_from_server = urllib.request.urlopen(url).read()
    string_from_server = data_from_server.decode('utf-8')
    country_list = json.loads(string_from_server)

    result_list = []
    for country_dictionary in country_list:
        name = country_dictionary['name']

        if type(name) != type(''):
            raise Exception('Name is wrong type: "{0}"'.format(name))

        result_list.append(name)

    return result_list


def get_country_details(country):

    base_url = 'https://restcountries.eu/rest/v2/name/{0}/'
    url = base_url.format(country)
    try:
        data_from_server = urllib.request.urlopen(url).read()
    except:
        print("Invalid input", file=sys.stderr)
        return {}
    string_from_server = data_from_server.decode('utf-8')
    country_list = json.loads(string_from_server)

    for country_dictionary in country_list:
        name = country_dictionary['name']
        capital = country_dictionary['capital']
        region = country_dictionary['region']
        population = country_dictionary['population']
        area = country_dictionary['area']

        if type(name) != type(''):
            raise Exception('Name is wrong type: "{0}"'.format(name))
        if type(capital) != type(''):
            raise Exception('Capital is wrong type: "{0}"'.format(capital))
        if type(region) != type(''):
            raise Exception('Region is wrong type: "{0}"'.format(region))
        if type(population) != type(0):
            raise Exception('Population is wrong type: "{0}"'.format(population))
        if type(area) != type(0.0):
            raise Exception('Area has wrong type: "{0}"'.format(area))

        result = {'Name': name, 'Capital': capital, 'Region': region, 'Population': population, 'Area': area}

    return result

def main():
    if len(sys.argv) != 2:
        print("Usage: python3 api-test.py country_name")
        print("Use 'all' in place of country_name for all countries")
        exit()

    if sys.argv[1] == "all":
        country_list = get_countries()
        for country in country_list:
            print(country)
    else:
        country_details = get_country_details(sys.argv[1])
        for key in country_details:
            print(key + ": " + str(country_details[key]))




if __name__ == '__main__':
    main()
