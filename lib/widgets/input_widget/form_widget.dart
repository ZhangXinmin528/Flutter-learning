import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///文本输入使用示例
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String _title = 'Form Widget Example';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyStatefulWidgetState();
  }
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
        key: _fromKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your email',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: RaisedButton(
                onPressed: () {
                  if (_fromKey.currentState.validate()) {
                    print('数据有效~');
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ));
  }
}
