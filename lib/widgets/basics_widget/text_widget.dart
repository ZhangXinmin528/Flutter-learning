import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Flutter basics widget:Text',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter basics widget:Text'),
        ),
        body: Center(
          child: _buildSpanTextContent(),
        ),
      ),
    );
  }

  Widget _buildTextContent() {
    return new Text(
      'Hello, Flutter! How are you?',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  //富文本
  Widget _buildSpanTextContent() {
    return Text.rich(TextSpan(
      text: 'Hello',
      children: <TextSpan>[
        TextSpan(
          text: 'beautiful',
          style: TextStyle(
            color: Colors.blue,
            fontStyle: FontStyle.italic,
          ),
        ),
        TextSpan(
            text: 'world!',
            style: TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            )),
      ],
    ));
  }
}
