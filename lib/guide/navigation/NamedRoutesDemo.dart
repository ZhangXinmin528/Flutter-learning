import 'package:flutter/material.dart';

//导航到对应名称的 routes 里
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'Named routes demo';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //当使用 initialRoute 时，需要确保你没有同时定义 home 属性。
    return MaterialApp(
      title: appTitle,
      initialRoute: '/',
      routes: {
        '/': (context) {
          return FirstScreen();
        },
        '/second': (context) {
          return SecondScreen();
        }
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
          child: Text('To Second'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Back'),
        ),
      ),
    );
  }
}
