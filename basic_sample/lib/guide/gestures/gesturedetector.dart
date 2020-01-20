import 'package:flutter/material.dart';

//捕获和处理点击动作
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'GestureDetector Example';

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
        child: MyButton(),
      ),
    );
  }
}

//My Custom Button
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        final snackbar = SnackBar(
          content: Text('Click The Button~'),
          action: SnackBarAction(label: 'Ok', onPressed: () {}),
        );
        Scaffold.of(context).showSnackBar(snackbar);
      },
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Text('Tab'),
      ),
    );
  }
}
