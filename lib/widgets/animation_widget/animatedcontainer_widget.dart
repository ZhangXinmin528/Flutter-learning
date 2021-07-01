import 'package:flutter/material.dart';

///动画容器
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String _title = 'AnimatedContainer Widget Example';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyStatefulWidgetState();
  }
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 2),
          width: selected ? 200 : 100,
          height: selected ? 100 : 200,
          color: selected ? Colors.green : Colors.red,
          alignment:
              selected ? Alignment.center : AlignmentDirectional.topCenter,
          curve: Curves.fastOutSlowIn,
          child: FlutterLogo(size: 75),
        ),
      ),
    );
  }
}
