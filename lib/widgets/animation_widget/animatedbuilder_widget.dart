import 'package:flutter/material.dart';

///基本的动画控件
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String _title = 'AnimatedBuilder widget example';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: Spinner(),
      ),
    );
  }
}

class Spinner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SpinnerState();
  }
}

class _SpinnerState extends State<Spinner> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(
        animation: _controller,
        child: Container(
          width: 200.0,
          height: 200.0,
          color: Colors.green,
          child: const Center(
            child: Text('旋转'),
          ),
        ),
        builder: (BuildContext context, Widget child) {
          return Transform.rotate(
            angle: _controller.value * 2.0 * 3.14,
            child: child,
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
