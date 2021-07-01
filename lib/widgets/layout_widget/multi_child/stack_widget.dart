import 'package:flutter/material.dart';

///实现类似于堆叠效果的布局
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'Multi child layout widget : Stack';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: _buildStackEnhanceText(),
      ),
    );
  }

  Widget _buildStackWidget() {
    return new Stack(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
        Container(
          width: 90,
          height: 90,
          color: Colors.green,
        ),
        Container(
          width: 80,
          height: 80,
          color: Colors.blue,
        ),
      ],
    );
  }

  Widget _buildStackEnhanceText() {
    return SizedBox(
      width: 250,
      height: 250,
      child: Stack(
        children: <Widget>[
          Container(
            width: 250,
            height: 250,
            color: Colors.blue,
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.black.withAlpha(0),
                  Colors.black12,
                  Colors.black45
                ],
              ),
            ),
            child: Text(
              'Foreground Text',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
