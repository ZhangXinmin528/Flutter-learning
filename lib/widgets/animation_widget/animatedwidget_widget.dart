import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String _title = 'Animated Widget Example';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: _title,
      home: Scaffold(
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

class _SpinnerState extends State<Spinner> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 10), vsync: this)
          ..repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SpinnerContainer(
      controller: _controller,
    );
  }
}

class SpinnerContainer extends AnimatedWidget {
  const SpinnerContainer({Key key, AnimationController controller})
      : super(key: key, listenable: controller);

  Animation<double> get _progress {
    return listenable;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Transform.rotate(
      angle: _progress.value * 2.0 * 3.14,
      child: Container(
        width: 200.0,
        height: 200.0,
        color: Colors.green,
      ),
    );
  }
}
