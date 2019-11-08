# Python imports
from flask import Flask, escape, request, jsonify
import json

#Used to import relative paths
import sys
import os
folder = os.path.dirname(os.path.abspath(__file__))  # noqa
sys.path.insert(0, os.path.normpath("%s/.." % folder))  # noqa

#For devices
from pytradfri import Gateway
#For error handling
from pytradfri.error import PytradfriError
from pytradfri.util import load_json, save_json
from packages import libcoap

import argparse

app = Flask(__name__)

# '''
# USED FOR CONFIGURATION OF IKEA GATEWAY
# '''
# CONFIG_FILE = 'tradfri_standalone_psk.conf'

# parser = argparse.ArgumentParser()
# parser.add_argument('host', metavar='IP', type=str,
#                 help='IP Address of your Tradfri gateway')
# parser.add_argument('-K', '--key', dest='key', required=False,
#                 help='Security code found on your Tradfri gateway')
# args = parser.parse_args()

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'GET':
        res = {"text": "This is the reponse"}
        return jsonify(res)
    elif request.method == 'POST':
        print(request.data)
        return jsonify({"text": "Accepted!"})

# @app.route('/devices', methods=['GET', 'PUT', 'POST', 'DELETE'])
# def devices():
    # # Incoming request should be JSON.

    # if args.host not in load_json(CONFIG_FILE) and args.key is None:
    #     return {"returnVal": "Please provide the security code on the back of your IKEA Gateway"}
    #     key = input().strip() #This should be replaces with some JSON k/v pair
    #     if len(key) != 16:
    #         raise PytradfriError("Invalid 'Security Code' provided.")
    #     else:
    #         args.key = key

# @app.route('/devices/<id>/state', methods=['GET', 'POST'])

app.run(debug=True)