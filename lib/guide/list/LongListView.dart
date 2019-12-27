import 'package:flutter/material.dart';

//标准的 ListView 构造函数适用于短列表，
// 对于具有大量列表项的长列表，需要用 ListView.builder 构造函数来创建。
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'Long ListView';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: ListView.builder(
            itemCount: 1000,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Item #$index'),
              );
            }),
      ),
    );
  }
}
