import 'package:flutter/material.dart';

//使用 tabs
void main() {
  runApp(TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  final appTitle = 'TabBar Usage Example';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text(appTitle),
              bottom: TabBar(tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ]),
            ),
            body: TabBarView(children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ]),
          )),
    );
  }
}
