import 'dart:convert';

import 'package:http/http.dart';

final String url = r'http://839db8ce.ngrok.io/';

Future makeRequest(String method, [String data]) async {
  if (method == 'GET') {
    Response response = await get(url);
    return response.body;
  } else if (method == 'POST') {
    String json = jsonEncode(data);
    Response response = await post(url, body: json);
    return response.body.toString();
  } else {
    print('You dumb!');
  }
}