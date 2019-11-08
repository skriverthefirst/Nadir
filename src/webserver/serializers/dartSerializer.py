#Serializer for converting incoming request from DART code
class DartSerializer():
    def __init__(self, name, desc, gateway, gatewayIP):
        self.name = name
        self.desc = desc
        self.gateway = gateway
        self.gatewayIP = gatewayIP

    def toJson(self):
        pass

    def fromJson(self):
        pass