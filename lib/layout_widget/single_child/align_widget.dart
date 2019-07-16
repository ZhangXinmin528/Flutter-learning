import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'Single child layout widgets : Align';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: _buildOffsetAlignWidget(),
      ),
    );
  }

  Widget _buildLogoAlignWidget() {
    return Center(
      child: Container(
        height: 120.0,
        width: 120.0,
        color: Colors.blue[50],
        child: Align(
          alignment: Alignment.topRight,
          child: FlutterLogo(
            size: 50,
          ),
        ),
      ),
    );
  }

  //计算一个相对位置，计算公式为：
  //(0.2 * width of FlutterLogo/2 + width of FlutterLogo/2,
  // 0.6 * height of FlutterLogo/2 + height of FlutterLogo/2) = (36.0, 48.0).
  Widget _buildRelativeAlignWidget() {
    return Center(
      child: Container(
        height: 120.0,
        width: 120.0,
        color: Colors.blue[50],
        child: Align(
          alignment: Alignment(0.2, 0.6),
          child: FlutterLogo(
            size: 50,
          ),
        ),
      ),
    );
  }

  //计算一个相对位置，公式为：
  //(0.2 * width of FlutterLogo, 0.6 * height of FlutterLogo) = (12.0, 36.0)
  // in the coordinate system of the blue container.
  //(0.2 * width of Align, 0.6 * height of Align) = (24.0, 72.0)
  // in the coordinate system of the Align widget.
  Widget _buildOffsetAlignWidget(){
    return Center(
      child: Container(
        height: 120.0,
        width: 120.0,
        color: Colors.blue[50],
        child: Align(
          alignment: FractionalOffset(0.2, 0.6),
          child: FlutterLogo(
            size: 50,
          ),
        ),
      ),
    );
  }
}
