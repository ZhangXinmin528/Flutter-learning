import 'package:flutter/material.dart';

///标题栏使用示例
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter basics widget:Scaffold';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
      showPerformanceOverlay: true, //显示UI渲染性能
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyStatefulWidgetState();
  }

  MyStatefulWidget({Key key}) : super(key: key);
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter basics widget:Scaffold'),
      ),
      body: Center(
        child: Text('You have pressed $_count times!'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60.0,
          color: Colors.deepOrange,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _count++;
          });
        },
        tooltip: 'Increatement Counter',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
