import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final title = 'Fade in images';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: _buildHolderFromCache(),
        // body: _buildHolderFromDisk(),
      ),
    );
  }

  //从内存中加载透明占位符
  Widget _buildHolderFromCache() {
    return Stack(
      children: <Widget>[
        Center(
          child: CircularProgressIndicator(),
        ),
        Center(
          child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: 'https://picsum.photos/250?image=9'),
        ),
      ],
    );
  }

  //从本地存储中加载占位符
  Widget _buildHolderFromDisk() {
    return Center(
      child: FadeInImage.assetNetwork(
        placeholder: 'images/pic1.jpg',
        image: 'https://picsum.photos/250?image=9',
      ),
    );
  }
}
