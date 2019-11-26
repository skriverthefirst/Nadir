import 'dart:convert';

import 'package:http/http.dart';

final String url = r'http://129894bd.ngrok.io/devices';

String jsonConvert(String jsonIdentifier, String data) {
  var jsonConvert = {};
  jsonConvert[jsonIdentifier] = data;
  String jsonData = json.encode(jsonConvert);
  return jsonData;
}

Future makeRequest(String method, [String data]) async {
  if (method == 'GET') {
    print("Some String");
    Response response = await get(url);
    print(response.body);
    return response.body;
  } else if (method == 'POST') {
    Response response = await post(url, body: data);
    return response.body.toString();
  } else {
    print('You dumb!');
  }
}