import 'package:flutter/material.dart';

void main() {
  runApp(PageBuilderWidget());
}

///1.使用默认构造器
class PageDefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PageView",
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PageView'),
        ),
        body: PageView(
          onPageChanged: (index) {
            print('Current page is $index');
          },
          children: [
            ListTile(
              title: Text('page one~'),
            ),
            ListTile(
              title: Text('page two~'),
            ),
            ListTile(
              title: Text('page three~'),
            ),
            ListTile(
              title: Text('page four~'),
            ),
          ],
        ),
      ),
    );
  }
}

///2.PageView.builder
class PageBuilderWidget extends StatelessWidget {
  final List<String> dataList =
      List<String>.generate(100, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PageView',
      home: Scaffold(
        appBar: AppBar(
          title: Text('PageView'),
        ),
        body: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: dataList.length,
            onPageChanged: (index) {
              print('Current page is $index~');
            },
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Page Index : ${dataList[index]}'),
              );
            }),
      ),
    );
  }
}
