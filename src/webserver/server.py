# Python imports
from flask import Flask, escape, request, jsonify
import json
import uuid
import asyncio
import ast

#Used to import relative paths
import sys
import os
folder = os.path.dirname(os.path.abspath(__file__))  # noqa
sys.path.insert(0, os.path.normpath("%s/.." % folder))  # noqa

from asyncs.async_methods import async_methods
from db_handler.dbHandler import DBHandler

with DBHandler(os.path.join(os.getcwd(), 'something.db')) as dbHandler:
    app = Flask(__name__)
    asyncio.set_event_loop(asyncio.new_event_loop())
    loop = asyncio.get_event_loop()

    am = async_methods(loop)

    @app.route('/', methods=['GET', 'POST'])
    def index():
        if request.method == 'GET':
            res = {"text": "This is the reponse"}
            return jsonify(res)
        elif request.method == 'POST':
            print(request.data)
            return jsonify({"text": "Accepted!"})

    #Used for device handling in DB
    @app.route('/devices', methods=['GET', 'PUT', 'POST', 'DELETE'])
    def devices():
        print("Incoming request: {}".format(request.data))
        if request.method == 'POST':
            jsonString = json.loads(request.data)
            if "name" and "desc" and "gateway" and "gatewayIP" in jsonString:
                print(json.loads(request.data))
            am.command(jason["state"])
        return jsonify({"text": "Very niiice"}), 200


    if __name__ == "__main__":
        app.run(debug=True)
