from Flask import flask

app = Flask('demo')

@app.get('/')
def greet():
    return 'hello from jenkins'

app.run(port=5000,host='0.0.0.0')