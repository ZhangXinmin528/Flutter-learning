import 'package:flutter/material.dart';

///透明度动画
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String _title = 'AnimatedOpacity Widget Example';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: Center(
          child: LogoFade(),
        ),
      ),
    );
  }
}

class LogoFade extends StatefulWidget {
  LogoFade({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LogoFadeState();
  }
}

class _LogoFadeState extends State<LogoFade> {
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() {
      opacityLevel = opacityLevel == 0.0 ? 1.0 : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedOpacity(
          opacity: opacityLevel,
          duration: Duration(seconds: 3),
          child: FlutterLogo(
            size: 64.0,
          ),
        ),
        RaisedButton(
          child: Text('Fade Logo'),
          onPressed: _changeOpacity,
        ),
      ],
    );
  }
}
