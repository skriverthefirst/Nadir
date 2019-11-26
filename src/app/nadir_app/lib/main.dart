import 'package:flutter/material.dart';
import 'package:nadir_app/views/aabenthus.dart';

import 'package:nadir_app/views/sdlist.dart';
import 'inherited_widget/sd_inherited_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return SDInheritedWidget(
      MaterialApp(
        // title: 'Åbenthus Demo',
        // home: Aabenthus(),
        title: 'Nadir Smart Home Controller',
        home: SDlist(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}