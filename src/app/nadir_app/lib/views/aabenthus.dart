import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nadir_app/utils/http/http_handler.dart';

bool bulbOn = false;

class Aabenthus extends StatefulWidget {
  @override
  _AabenthusState createState() => _AabenthusState();
}

class _AabenthusState extends State<Aabenthus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aabenthus Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _MultipleUseButton('Bord: Tænd', Colors.greenAccent, 75, 150, () {
                    makeRequest('POST', _jsonConvert("1on"));
                  }),
                  _MultipleUseButton('Bord: Sluk', Colors.redAccent, 75, 150, () {
                    makeRequest('POST', _jsonConvert("1off"));
                  }),
                ],
              ),
              Container(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _MultipleUseButton('Loft: Tænd', Colors.greenAccent, 75, 150, () {
                    makeRequest('POST', _jsonConvert("2on"));
                  }),
                  _MultipleUseButton('Loft: Sluk', Colors.redAccent, 75, 150, () {
                    makeRequest('POST', _jsonConvert("2off"));
                  }),
                ],
              ),
              Container(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _MultipleUseButton('Alle: Tænd', Colors.greenAccent, 75, 150, () {
                    makeRequest('POST', _jsonConvert("allon"));
                  }),
                  _MultipleUseButton('Alle: Sluk', Colors.redAccent, 75, 150, () {
                    makeRequest('POST', _jsonConvert("alloff"));
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MultipleUseButton extends StatelessWidget {

  final String _text;
  final Color _color;
  final double _height;
  final double _width;
  final Function _onPressed;

  _MultipleUseButton(this._text, this._color, this._height, this._width, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _onPressed,
      child: Text(
        _text,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white
        ),
      ),
      height: _height,
      minWidth: _width,
      color: _color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(color: Colors.greenAccent),
      ),
    );
  }
}

String _jsonConvert(String data) {
  var jsonConvert = {};
  jsonConvert["state"] = data;
  String jsonData = json.encode(jsonConvert);
  return jsonData;
}