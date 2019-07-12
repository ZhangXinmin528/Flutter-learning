import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

//
void main() {
  debugPaintSizeEnabled = true; // remove to suppress visual layout

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        // Change to buildFoo() for the other examples
        body: Center(child: buildExpandedImagesFlex()),
      ),
    );
  }

  //调整Widget大小，超出部分，受影响的边缘会出现黄色和黑色条纹图案。
  Widget buildOverflowingRow() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image.asset('images/pic4.jpg'),
        Image.asset('images/pic5.jpg'),
        Image.asset('images/pic6.jpg'),
      ],
    );
  }

  //可以使用Expanded Widget，调整Widgets的大小以适应行或列；
  Widget buildExpandedImages() {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Image.asset('images/pic4.jpg'),
        ),
        Expanded(
          child: Image.asset('images/pic5.jpg'),
        ),
        Expanded(
          child: Image.asset('images/pic6.jpg'),
        ),
      ],
    );
  }

  //可以使用 Expanded widget 的 flex 属性，这是一个用来确定 widget 的弹性系数的整数。
  // 默认的弹性系数为 1。
  Widget buildExpandedImagesFlex() {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Image.asset('images/pic4.jpg'),
        ),
        Expanded(
          flex: 2,
          child: Image.asset('images/pic5.jpg'),
        ),
        Expanded(
          child: Image.asset('images/pic6.jpg'),
        ),
      ],
    );
  }
}
