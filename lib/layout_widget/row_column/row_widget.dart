import 'package:flutter/material.dart';

void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: new Text('Flutter layout demo'),
        ),

        body: _buildRowExample(),
      ),
    );
  }

  Widget _buildRowExample(){
    return new Row(
      children: <Widget>[
        Text('Deliver features faster',textAlign: TextAlign.center,),
        Text('Craft beautiful UIs',textAlign: TextAlign.center,),
        Expanded(child: FittedBox(
          fit: BoxFit.contain,
          child: const FlutterLogo(),
        ))

      ],
    );
  }

}