import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'Single child layout widgets : Padding';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: _buildPaddingWidget(),
      ),
    );
  }

  Widget _buildPaddingWidget() {
    return new Padding(
      padding: EdgeInsets.all(12.0),
      child: const Card(
        color: Colors.amberAccent,
        child: Text('Hello World!'),
      ),
    );
  }
}
