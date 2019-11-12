# Python imports
from flask import Flask, escape, request, jsonify
import json
import uuid
import asyncio

#Used to import relative paths
import sys
import os
folder = os.path.dirname(os.path.abspath(__file__))  # noqa
sys.path.insert(0, os.path.normpath("%s/.." % folder))  # noqa

#For devices
from pytradfri import Gateway
from pytradfri.api.aiocoap_api import APIFactory
#For error handling
from pytradfri.error import PytradfriError
from pytradfri.util import load_json, save_json
from packages import libcoap

import argparse

app = Flask(__name__)

'''
USED FOR CONFIGURATION OF IKEA GATEWAY
'''
CONFIG_FILE = 'tradfri_standalone_psk.conf'

try:
    json = load_json(CONFIG_FILE)
except PytradfriError as e:
    print(e)

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'GET':
        res = {"text": "This is the reponse"}
        return jsonify(res)
    elif request.method == 'POST':
        print(request.data)
        return jsonify({"text": "Accepted!"})

@app.route('/devices', methods=['GET', 'PUT', 'POST', 'DELETE'])
async def devices():
    print(json)
    ip = list(json.keys())[0]
    key = json[ip]['key']

    if 'host' not in json and key is None:
        return {"returnVal": "Please provide the security code on the back of your IKEA Gateway"}
        keyValue = {'key': 'SomeValue'} #This should be replaces with some JSON k/v pair
        if len(key) != 16:
            raise PytradfriError("Invalid 'Security Code' provided.")
        else:
            key = keyValue

    try:
        identity = json[ip].get('identity')
        psk = json[ip].get('key')
        api_factory = APIFactory(host=ip, psk_id=identity, psk=psk)
    except KeyError:
        identity = uuid.uuid4().hex
        api_factory = APIFactory(host=ip, psk_id=identity)

        try:
            psk = await api_factory.generate_psk(key)
            print('Generated PSK: ', psk)

            json[ip] = {'identity': identity,
                               'key': psk}
            save_json(CONFIG_FILE, json)
        except:
            pass

    api = api_factory.request

    gateway = Gateway()

    devices_command = gateway.get_devices()
    devices_commands = await api(devices_command)
    devices = await api(devices_commands)

    lights = [dev for dev in devices if dev.has_light_control]

    print(lights)

    light = None
    # Find a bulb that can set color
    for dev in lights:
        if dev.light_control.can_set_color:
            light = dev
            break

    if not light:
        print("No color bulbs found")
        return jsonify({"text": "No color bulbs found"})

    return jsonify({"text": "Very niiice"})

# @app.route('/devices', methods=['GET', 'PUT', 'DELETE'])
# def deviceHandling():
#     pass

if __name__ == "__main__":
    app.run(debug=True)