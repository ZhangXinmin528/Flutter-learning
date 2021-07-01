import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'Form Validation Demo';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyCustomFormState();
  }
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter something';
                } else {
                  return null;
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Processing data~'),
                      action: SnackBarAction(label: 'Ok', onPressed: () {}),
                    ));
                  }
                },
                child: Text('Submit'),
              ),
            )
          ],
        ));
  }
}
