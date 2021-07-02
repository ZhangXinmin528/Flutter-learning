import 'package:flutter/material.dart';

///添加点按涟漪效果 (Material Design)
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'InkWell Example';

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

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Click the button~'),
            action: SnackBarAction(
              label: 'Ok',
              onPressed: () {},
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(
            left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text('Click'),
      ),
    );
  }
}
