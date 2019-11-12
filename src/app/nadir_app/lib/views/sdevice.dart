
import 'package:flutter/material.dart';

import 'package:nadir_app/inherited_widget/sd_inherited_widget.dart';

enum SDMode {
  Adding,
  Editing
}

class SDevice extends StatefulWidget {

  final SDMode sdMode;
  final int index;

  SDevice(this.sdMode, this.index);

  @override
  _SDeviceState createState() => _SDeviceState();
}

class _SDeviceState extends State<SDevice> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _gWController = TextEditingController();
  final TextEditingController _gWiPController = TextEditingController();

  List<Map<String, String>> get _sds => SDInheritedWidget.of(context).SDs;

  @override
  void didChangeDependencies() {
    if (widget?.sdMode == SDMode.Editing) {
      _nameController.text = _sds[widget.index]['name'];
      _descController.text = _sds[widget.index]['desc'];
      _gWController.text = _sds[widget.index]['gateway'];
      _gWiPController.text = _sds[widget.index]['gatewayIP'];
    }
    super.didChangeDependencies();
  }

  var dropdownSelectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.sdMode == SDMode.Adding ? 'Add Smart Device' : 'Edit Smart Device'
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _TextFields(_nameController, 'Name of Smart Device'),
              Container(height: 8,),
              _TextFields(_descController, 'Description for Smart Device <e.g group>'),
              Container(height: 8,),
              // DropdownButton <String>(
              //   hint: Text('Please choose the manufacturer of the gateway'),
              //   style: TextStyle(color: Colors.grey),
              //   items: <String>['Ikea Traadfri', 'Philips Hue', 'Google Nest'].map((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value)
              //     );
              //   }).toList(),
              //   value: dropdownSelectedItem,
              //   onChanged: (val) { dropdownSelectedItem = val; setState((){}); },
              // ),
              _TextFields(_gWController, 'Connected Gateway of Smart Device'),
              Container(height: 8,),
              _TextFields(_gWiPController, 'IP of Gateway of Smart Device'),
              Container(height: 16.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _SvDelRmButton('Save', Colors.blue, () {
                    final name = _nameController.text;
                    final desc = _descController.text;
                    final gw = _gWController.text;
                    final gwip = _gWiPController.text;

                    if (widget?.sdMode == SDMode.Adding){
                      _sds.add({
                        'name': name,
                        'desc': desc,
                        'gateway': gw,
                        'gatewayIP': gwip
                      });
                    } else if (widget?.sdMode == SDMode.Editing) {
                      _sds[widget.index] = {
                        'name': name,
                        'desc': desc,
                        'gateway': gw,
                        'gatewayIP': gwip
                      };
                    }
                    Navigator.pop(context);
                  }),
                  Container(height: 16.0,),
                  _SvDelRmButton('Discard', Colors.grey, () {
                    Navigator.pop(context);
                  }),
                  widget.sdMode == SDMode.Editing ?
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: _SvDelRmButton('Delete', Colors.red, () {
                        _sds.removeAt(widget.index);
                        Navigator.pop(context);
                      }),
                    )
                  : Container()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _SvDelRmButton extends StatelessWidget {

  final String _text;
  final Color _color;
  final Function _onPressed;

  _SvDelRmButton(this._text, this._color, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _onPressed,
      child: Text(
        _text,
        style: TextStyle(color: Colors.white),
      ),
      height: 40,
      minWidth: 100,
      color: _color,
    );
  }
}

class _TextFields extends StatelessWidget {

  final TextEditingController _controller;
  final String _text;

  _TextFields(this._controller, this._text);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: _text
      )
    );
  }
}