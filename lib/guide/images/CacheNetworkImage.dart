import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

//使用缓存图片
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'Cached Images Example';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: Center(
          child: CachedNetworkImage(
            placeholder: (context, url) {
              return CircularProgressIndicator();
            },
            imageUrl: 'https://picsum.photos/250?image=9',
          ),
        ),
      ),
    );
  }
}
