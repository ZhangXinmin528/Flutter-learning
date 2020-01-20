import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  static const String _title = 'Text widget : RichText';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: _buildRichTextSample(context),
      ),
    );
  }


  Widget _buildRichTextSample(BuildContext context){
    return RichText(
        text: TextSpan(
          text: '富文本演示实例：',
          style: TextStyle(
            color: Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(
              text: '粗体',
              style: TextStyle(
                color: Colors.black,
                fontWeight:FontWeight.bold,
              ),
            ),
            TextSpan(
              text: '蓝色斜体',
              style: TextStyle(
                color: Colors.blue,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
    );
  }
}