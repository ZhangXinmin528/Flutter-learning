import 'package:flutter/material.dart';

//使用字体
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'Package Fonts Example';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(
        title: appTitle,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          'Example for using the Raleway font~',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 28.0,
            fontWeight: FontWeight.w400,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
