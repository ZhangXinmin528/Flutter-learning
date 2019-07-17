import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'Multi child layout widget : ListView';

  final List<String> entries = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'k',
  ];
  final List<MaterialColor> colors = <MaterialColor>[
    Colors.amber,
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.pink,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.purple,
    Colors.lime,
    Colors.cyan,
    Colors.grey
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: _buildListViewWithDivider(),
      ),
    );
  }

  Widget _buildListViewSample1() {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: <Widget>[
        Container(
          height: 50,
          color: Colors.amber[600],
          child: const Center(
            child: Text('Entry A'),
          ),
        ),
        Container(
          height: 50,
          color: Colors.amber[500],
          child: const Center(
            child: Text('Entry B'),
          ),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: const Center(
            child: Text('Entry C'),
          ),
        ),
      ],
    );
  }

  Widget _buildLazyListViewSample() {
    return ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: colors[index],
          child: Center(
            child: Text('Entry ${entries[index]}'),
          ),
        );
      },
    );
  }

  Widget _buildListViewWithDivider() {
    return ListView.separated(
      padding: EdgeInsets.all(8.0),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: colors[index],
          child: Center(
            child: Text('Entry ${entries[index]}'),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
      itemCount: entries.length,
    );
  }
}
