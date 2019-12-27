import 'package:flutter/material.dart';

//创建拥有不同列表项的列表
void main() {
  runApp(
    MyApp(
      items: List<ListItem>.generate(
        1000,
        (i) {
          return i % 6 == 0
              ? HeadingItem(heading: 'Heading $i')
              : MessageItem(sender: 'Sender $i', body: 'Message body $i');
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final appTitle = 'Mixed type list';
  final List<ListItem> items;

  MyApp({Key key, @required this.items});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            if (item is HeadingItem) {
              return ListTile(
                title: Text(
                  item.heading,
                  style: Theme.of(context).textTheme.headline,
                ),
              );
            } else if (item is MessageItem) {
              return ListTile(
                title: Text(item.sender),
                subtitle: Text(item.body),
              );
            }
          },
        ),
      ),
    );
  }
}

//Item类型基类
abstract class ListItem {}

//标题类型
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem({this.heading});
}

//
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem({this.sender, this.body});
}
