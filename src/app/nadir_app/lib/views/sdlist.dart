import 'package:flutter/material.dart';

import 'package:nadir_app/views/sdevice.dart';
import 'package:nadir_app/inherited_widget/sd_inherited_widget.dart';

class SDlist extends StatefulWidget {
  @override
  _SDlistState createState() => _SDlistState();
}

class _SDlistState extends State<SDlist> {

  List<Map<String, String>> get _sds => SDInheritedWidget.of(context).SDs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nadir Smart Home Controller'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SDevice(SDMode.Editing, index))
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 30, left: 13.0, right: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _SDName(_sds[index]['name']),
                    Container(height: 4,),
                    _SDDescription(_sds[index]['desc'])
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: _sds.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SDevice(SDMode.Adding, null))
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _SDName extends StatelessWidget {
  final String _name;

  _SDName(this._name);

  @override
  Widget build(BuildContext context) {
    return Text(
      _name,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold
      ),
    );
  }
}

class _SDDescription extends StatelessWidget {
  final String _desc;

  _SDDescription(this._desc);

  @override
  Widget build(BuildContext context) {
    return Text(
      _desc,
      style: TextStyle(
          color: Colors.grey.shade600
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}