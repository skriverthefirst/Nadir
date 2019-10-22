# Python imports
import os
from flask import Flask, escape, request
import json

app = Flask(__name__)

@app.route('/', methods=['GET'])
def main():
    

# @app.route('/register', methods=['GET', 'POST'])

# @app.route('/login', methods=['GET', 'POST'])

# @app.route('/devices', methods=['GET', 'PUT', 'POST', 'DELETE'])

# @app.route('/devices/<id>/state', methods=['GET', 'POST'])
