import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: new AppBar(
          title: Text('RaisedButton Example'),
        ),
        body: MyStatelessWidget(),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const RaisedButton(
            onPressed: null,
            child: Text(
              'Disabled Button',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          RaisedButton(
            onPressed: (){},
            child: const Text(
              'Enabled Button',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 30),
          RaisedButton(
            onPressed: () {},
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                Color(0xff0d47a1),
                Color(0xff1976d2),
                Color(0xff42a5f5),
              ])),
              padding: EdgeInsets.all(10.0),
              child: const Text(
                'Gradient Button',
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
