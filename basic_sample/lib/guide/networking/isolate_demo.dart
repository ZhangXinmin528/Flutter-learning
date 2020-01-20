import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//在后台处理 JSON 数据解析
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'Isolate Demo';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: appTitle,
      home: MyHomepage(title: appTitle),
    );
  }
}

class MyHomepage extends StatelessWidget {
  final String title;

  MyHomepage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          return snapshot.hasData
              ? PhotoList(
                  photos: snapshot.data,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
        future: fetchPhotos(http.Client()),
      ),
    );
  }
}

class PhotoList extends StatelessWidget {
  final List<Photo> photos;

  PhotoList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Image.network(photos[index].thumbnailUrl);
      },
    );
  }
}

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
        albumId: json['albumId'] as int,
        id: json['id'] as int,
        title: json['title'] as String,
        url: json['url'] as String,
        thumbnailUrl: json['thumbnailUrl'] as String);
  }
}

//发起网络请求
Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response =
      await client.get('https://jsonplaceholder.typicode.com/photos');
  //Flutter 提供的 compute() 方法将解析和转换的工作移交到一个后台 isolate 中
  return compute(parsePhotos, response.body);
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Photo>((json) {
    return Photo.fromJson(json);
  }).toList();
}
