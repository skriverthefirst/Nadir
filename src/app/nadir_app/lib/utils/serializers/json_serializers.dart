class JsonRequest {
  final String name;
  final String desc;
  final String gateway;
  final String gatewayIP;

  JsonRequest({this.name, this.desc, this.gateway, this.gatewayIP});

  JsonRequest.fromMappedJson(Map<String, dynamic> json)
  : name = json['name'],
    desc = json['desc'],
    gateway = json['gateway'],
    gatewayIP = json['gatewayIP'];

  Map<String, dynamic> toJson() =>
  {
    'name': name,
    'desc': desc,
    'gateway': gateway,
    'gatewayIP': gatewayIP
  };
}