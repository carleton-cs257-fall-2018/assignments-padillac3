#Website Server Application.
#CS257-f18
#Yasmeen Awad and Chris Padilla

import flask
import sys

app = flask.Flask(__name__, static_folder='static', template_folder='templates')

@app.route('/')
def get_main_page():
    # figure out how to change url in browser when re-routing
    return get_map_page()


@app.route('/random')
def random():
    global api_port
    return flask.render_template('', api_port=api_port)


@app.route('/map')
def get_map_page():
    global api_port
    return flask.render_template('index.html', api_port=api_port)


if __name__ == '__main__':
    if len(sys.argv) != 4:
        print('Usage: {0} host port api-port'.format(sys.argv[0]), file=sys.stderr)
        exit()

    host = sys.argv[1]
    port = sys.argv[2]
    api_port = sys.argv[3]
    app.run(host=host, port=int(port), debug=True)
