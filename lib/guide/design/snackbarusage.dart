import 'package:flutter/material.dart';

///SnackBar使用示例
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'Snackbar Usage Example';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: SnackbarPage(),
      ),
    );
  }
}

class SnackbarPage extends StatelessWidget {
  SnackbarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: RaisedButton(
        onPressed: () {
          final snackbar = SnackBar(
            content: Text('Yay! A snackbar.'),
            action: SnackBarAction(label: 'Ok', onPressed: () {}),
          );
          Scaffold.of(context).showSnackBar(snackbar);
        },
        child: Text('Show Snackbar'),
      ),
    );
  }
}
