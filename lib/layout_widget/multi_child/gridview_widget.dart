import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'Multi child layout widget : GridView';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: _buildCustomScrollViewSample(),
      ),
    );
  }

  Widget _buildGridViewSample() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20.0),
      crossAxisSpacing: 10.0,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: const Text('He\'d have you all unravel at the'),
        ),
        Container(
          alignment: Alignment.center,
          child: const Text('Heed not the rabble'),
        ),
        Container(
          alignment: Alignment.center,
          child: const Text('Sound of screams but the'),
        ),
        Container(
          alignment: Alignment.center,
          child: const Text('Who scream'),
        ),
        Container(
          alignment: Alignment.center,
          child: const Text('Revolution is coming...'),
        ),
        Container(
          alignment: Alignment.center,
          child: const Text('Revolution, they...'),
        ),
      ],
    );
  }

  Widget _buildCustomScrollViewSample() {
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10.0,
            crossAxisCount: 2,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: const Text('He\'d have you all unravel at the'),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text('Heed not the rabble'),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text('Sound of screams but the'),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text('Who scream'),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text('Revolution is coming...'),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text('Revolution, they...'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
