import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Flutter basics widget:Row',
      home: Scaffold(
        appBar: AppBar(
          title: new Text('Flutter basics widget:Row'),
        ),
        body: _buildOverflowsRow(),
      ),
    );
  }

  Widget _buildRowExample() {
    return new Row(
      children: <Widget>[
        Expanded(
            child: new Text(
          'Deliver features faster',
          textAlign: TextAlign.center,
        )),
        Expanded(
            child: new Text(
          'Craft beautiful UIs',
          textAlign: TextAlign.center,
        )),
        Expanded(
            child: FittedBox(
          fit: BoxFit.contain,
          child: const FlutterLogo(),
        )),
      ],
    );
  }

  //Why does my row have a yellow and black warning stripe?
  Widget _buildOverflowsRow() {
    return new Row(
      children: <Widget>[
        const FlutterLogo(),
        const Text(
            'Flutter\'s hot reload helps you quickly and easily experiment,'
            ' build UIs, add features, and fix bug faster. '
            'Experience sub-second reload times, '
            'without losing state, on emulators, '
            'simulators, and hardware for iOS and Android.'),
        const Icon(Icons.sentiment_very_satisfied),
      ],
    );
  }

  Widget _buildOverflowsRowFixed() {
    return new Row(
      children: <Widget>[
        const FlutterLogo(),
        Expanded(
          child: const Text(
              'Flutter\'s hot reload helps you quickly and easily experiment,'
              ' build UIs, add features, and fix bug faster. '
              'Experience sub-second reload times, '
              'without losing state, on emulators, '
              'simulators, and hardware for iOS and Android.'),
        ),
        const Icon(Icons.sentiment_very_satisfied),
      ],
    );
  }
}
