import 'package:flutter/material.dart';

//创建一个水平滑动的列表
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'Horizontal List';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: Container(
          height: 200,
          margin: EdgeInsets.symmetric(vertical: 20.0),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                color: Colors.amberAccent,
                width: 120,
              ),
              Container(
                color: Colors.blue,
                width: 120,
              ),
              Container(
                color: Colors.cyan,
                width: 120,
              ),
              Container(
                color: Colors.deepOrange,
                width: 120,
              ),
              Container(
                color: Colors.green,
                width: 120,
              ),
              Container(
                color: Colors.indigo,
                width: 120,
              ),
              Container(
                color: Colors.lightBlue,
                width: 120,
              ),
              Container(
                color: Colors.orange,
                width: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
