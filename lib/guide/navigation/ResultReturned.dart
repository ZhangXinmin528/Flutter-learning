import 'package:flutter/material.dart';

//从一个页面回传数据
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'Result returned';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
          appBar: AppBar(
            title: Text(appTitle),
          ),
          body: Center(
            child: SelectedButton(),
          )),
    );
  }
}

class SelectedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      onPressed: () {
        _navigationSelectedPage(context);
      },
      child: Text('Cilck it!'),
    );
  }

  _navigationSelectedPage(BuildContext context) async {
    final result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SelectedScreen();
    }));

    final snackbar = SnackBar(
      content: Text('$result'),
      action: SnackBarAction(label: 'Ok', onPressed: () {}),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }
}

class SelectedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick an option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.pop(context, 'Yes!');
              },
              child: Text('Yes!'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context, 'No!');
              },
              child: Text('No!'),
            ),
          ],
        ),
      ),
    );
  }
}
