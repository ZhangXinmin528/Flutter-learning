import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main(){
  debugPaintSizeEnabled = false;
  runApp(new MyApp() );
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

        body: Center(
          child: _buildImageColumn(),
        ),
      ),
    );
  }

  Widget _buildImageColumn(){
    return new Container(
      decoration: BoxDecoration(
        color: Colors.black26,
      ),
      child: Column(
        children: <Widget>[
          _buildImageRow(1),
          _buildImageRow(3),
        ],
      ),
    );
  }

  Widget _buildDecoratedImage(int imageIndex){

    return new Expanded(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 10,color: Colors.black38),
            borderRadius: const BorderRadius.all(const Radius.circular(8)),
          ),
          margin: const EdgeInsets.all(4),
          child: Image.asset('images/pic$imageIndex.jpg'),
        ));
  }

  Widget _buildImageRow(int imageIndex){

    return new Row(
      children: <Widget>[
        _buildDecoratedImage(imageIndex),
        _buildDecoratedImage(imageIndex+1),
      ],
    );
  }
}