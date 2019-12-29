import 'package:flutter/material.dart';

//在列表顶部放置一个浮动的 app bar
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'Floating App Bar';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text(appTitle),
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'images/pic6.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              expandedHeight: 200,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ListTile(
                    title: Text('Item #$index'),
                  );
                },
                childCount: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
