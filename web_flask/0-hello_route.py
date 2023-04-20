#!/usr/bin/python3
""" Starts a Flash web Application """
from flask import Flask
app = Flask(__name__)


@app.route('/', strict_slashes=False)
def hello_hbnb():
    """ prints a message when / is called """
    return 'Hello HBNB!'


if __name__ == "__main__":
    """ Main Function """
    app.run(host='0.0.0.0', port=5000)
