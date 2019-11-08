import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nadir_app/utils/http/http_handler.dart';
import 'package:nadir_app/utils/serializers/json_serializers.dart';

class TestHttp extends StatefulWidget {
  @override
  _TestHttpState createState() => _TestHttpState();
}

class _TestHttpState extends State<TestHttp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Http'),
      ),
      body: Builder(
        builder: (context) => Center(
          child: Row(
            children: <Widget>[
            RaisedButton(
            child: Text('Send GET'),
            onPressed: () {
              makeRequest('GET').then((data) {
                Map textMap = jsonDecode(data);
                var text = JsonRequest.fromMappedJson(textMap);

                showToast(context, text.name);
              });
              }
            ),
            RaisedButton(
            child: Text('Send POST'),
            onPressed: () {
              var outText = 'This is some output';
              makeRequest('POST', outText).then((data) {
                Map textMap = jsonDecode(data);
                var text = JsonRequest.fromMappedJson(textMap);

                showToast(context, text.name);
              });
              }
            ),
            ]
          ),
          ),
        ),
    );
  }
}

void showToast(BuildContext context, String text) {
  final scaffold = Scaffold.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(text),
      action: SnackBarAction(
          label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}