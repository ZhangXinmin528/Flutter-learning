import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Flutter basics widget:Icon',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Flutter basics widget:Icon',
          ),
        ),
        body: Center(
          child: _buildIconWidget(),
        ),
      ),
    );
  }

  Widget _buildIconWidget() {
    return Icon(
      Icons.sentiment_very_satisfied,
      color: Colors.pink,
      size: 30.0,
    );
  }
}
