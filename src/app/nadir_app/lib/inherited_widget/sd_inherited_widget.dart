import 'package:flutter/material.dart';

class SDInheritedWidget extends InheritedWidget {

  final SDs = [
    {
      'name': "Smart Buld 1",
      'desc': "Kitchen",
      'gateway': "IKEA Traadfri",
      'gatewayIP': "192.168.1.101"
    },
    {
      'name': "Smart Buld 2",
      'desc': "Kitchen",
      'gateway': "IKEA Traadfri",
      'gatewayIP': "192.168.1.101"
    },
    {
      'name': "Smart Buld 3",
      'desc': "Kitchen",
      'gateway': "IKEA Traadfri",
      'gatewayIP': "192.168.1.101"
    }
  ];

  SDInheritedWidget(Widget child) : super(child: child);

  static SDInheritedWidget of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(SDInheritedWidget)as SDInheritedWidget);
  }

  @override
  bool updateShouldNotify( SDInheritedWidget oldWidget) {
    return oldWidget.SDs != SDs;
  }
}