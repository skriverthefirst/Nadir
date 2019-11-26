import asyncio

#For devices
from pytradfri import Gateway
from pytradfri.api.aiocoap_api import APIFactory
#For error handling
from pytradfri.error import PytradfriError
from pytradfri.util import load_json, save_json
from packages import libcoap
import uuid

import sys
import os
folder = os.path.dirname(os.path.abspath(__file__))  # noqa
sys.path.insert(0, os.path.normpath("%s/.." % folder))

'''
USED FOR CONFIGURATION OF IKEA GATEWAY
'''
CONFIG_FILE = ('/home/daebogo/Documents/Nadir/src/webserver/tradfri_standalone_psk.conf')

try:
    json = load_json(CONFIG_FILE)
except PytradfriError as e:
    print(e)

class async_methods():
    def __init__(self, eventLoop):
        print(json)
        self.loop = eventLoop
        self.identifier = list(json.keys())[0]
        self.key = json[self.identifier]['key']
        self.gateway = Gateway()

        self.generated_psk = self.loop.run_until_complete(self._generate_psk())

        self.identity = None
        self.api_factory = None
        self.psk = None

        try:
            self.identity = json[self.identifier].get('identity')
            self.psk = json[self.identifier].get('key')
            self.api_factory = APIFactory(host=self.identifier, psk_id=self.identity, psk=self.psk)
        except KeyError:
            self.identity = uuid.uuid4().hex
            self.api_factory = APIFactory(host=self.identifier, psk_id=self.identity)

        self.api = self.api_factory.request

        self.lights = self.loop.run_until_complete(self._get_bulbs())


    async def _generate_psk(self):
        try:
            self.psk = await self.api_factory.generate_psk(self.key)
            print('Generated PSK: ', self.psk)

            json[self.identifier] = {'identity': self.identity,
                            'key': self.psk}
            save_json(CONFIG_FILE, json)
            return True
        except AttributeError:
            return False

    async def _get_bulbs(self):
        devices_command = self.gateway.get_devices()
        devices_commands = await self.api(devices_command)
        devices = await self.api(devices_commands)

        lights = [dev for dev in devices if dev.has_light_control]

        return lights

    async def _on_one(self):
        on = self.lights[0].light_control.set_dimmer(100)
        await self.api(on)

    async def _on_two(self):
        on = self.lights[1].light_control.set_dimmer(100)
        await self.api(on)

    async def _off_one(self):
        off = self.lights[0].light_control.set_dimmer(0)
        await self.api(off)

    async def _off_two(self):
        off = self.lights[1].light_control.set_dimmer(0)
        await self.api(off)

    async def _variable_lm(self, sliderValue):
        sliding = self.lights[0].light_control.set_dimmer(sliderValue)
        await self.api(sliding)

    def command(self, someInput):
        if (someInput == '1on'):
            self.loop.run_until_complete(self._on_one())
        elif (someInput == '2on'):
            self.loop.run_until_complete(self._on_two())
        elif (someInput == 'allon'):
            self.loop.run_until_complete(self._on_one())
            self.loop.run_until_complete(self._on_two())
        elif (someInput == '1off'):
            self.loop.run_until_complete(self._off_one())
        elif (someInput == '2off'):
            self.loop.run_until_complete(self._off_two())
        elif (someInput == 'alloff'):
            self.loop.run_until_complete(self._off_one())
            self.loop.run_until_complete(self._off_two())
        elif (int(someInput) >= 0 and int(someInput) <= 100):
            self.loop.run_until_complete(self._variable_lm(int(someInput)))
        else:
            pass