import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'OrientationBuilder Usage Example';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: appTitle,
      home: OrientationList(
        title: appTitle,
      ),
    );
  }
}

class OrientationList extends StatelessWidget {
  final String title;

  OrientationList({this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            children: List.generate(
              100,
              (index) {
                return Center(
                  child: Text(
                    'Item $index',
                    style: Theme.of(context).textTheme.headline,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
