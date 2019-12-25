import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Flutter basics widget:Image',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter basics widget:Image'),
        ),
        body: Center(
          child: _obtainImageFromNet(),
        ),
      ),
    );
  }

  //Get a image from an AssetBundle using a key.
  Widget _buildAssetImage() {
    return Image.asset('images/pic1.jpg');
  }

  Widget _obtainImageFromNet() {
    return Image.network(
        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg');
  }

}
