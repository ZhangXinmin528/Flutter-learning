import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// 用于扩展Row，Expanded或者Flex控件
class MyApp extends StatelessWidget {
  static const String _title = 'Multi child layout widget : Expanded';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi child layout widget : Expanded'),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.red,
                height: 100,
              ),
            ),
            Container(
              color: Colors.blue,
              height: 100,
              width: 50,
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
