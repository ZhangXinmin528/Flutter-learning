import 'package:flutter/material.dart';

///废弃
void main() {
  runApp(MyApp());
}

@deprecated
class MyApp extends StatelessWidget {
  static const String _title = 'MD component widget : FlatButton';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: _title,
      home: new Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        floatingActionButton: FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.black,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.blueAccent,
            onPressed: null,
            child: Text(
              'Flat Button',
              style: TextStyle(fontSize: 20.0),
            )),
      ),
    );
  }
}
