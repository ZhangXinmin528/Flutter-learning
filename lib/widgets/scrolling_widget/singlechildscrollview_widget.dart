import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String _title = 'SingleChildScrollview Widget Example';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WidgetsApp(
      title: _title,
      builder: (BuildContext context, Widget navigator) {
        return MyStatelessWidget();
      },
      color: Color(0xffffffff),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: <Widget>[
                  Container(
                    color: const Color(0xff808000),
                    height: 120.0,
                  ),
                  Expanded(
                    child: Container(
                      color: const Color(0xff800000),
                      height: 120.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
