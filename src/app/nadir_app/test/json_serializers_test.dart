import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nadir_app/utils/serializers/json_serializers.dart';

void main() {
  group('Serialization of dart request to FLASK REST API', () {
    test('Deserailization & Serialization of outgoing json request', () {
      // Input will be these values: "SD1", "Kitchen", "IKEA Traadfri", "192.168.1.101"
      var jsonString = '{"name":"SD1","desc":"Kitchen","gateway":"IKEA Traadfri","gatewayIP":"192.168.1.101"}';

      Map requestMap = jsonDecode(jsonString);
      var parsedRequest = JsonRequest.fromMappedJson(requestMap);

      // Deserializing incoming request, checking if values are correct
      expect(parsedRequest.name, 'SD1');
      expect(parsedRequest.desc, 'Kitchen');
      expect(parsedRequest.gateway, 'IKEA Traadfri');
      expect(parsedRequest.gatewayIP, '192.168.1.101');

      //Serialization of outgoing request, check if the string is correct
      var outgoingRequest = jsonEncode(parsedRequest);
      expect(outgoingRequest, jsonString);
    });
  });
}