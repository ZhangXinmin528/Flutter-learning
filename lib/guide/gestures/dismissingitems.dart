import 'package:flutter/material.dart';

//实现「滑动清除」效果
void main() {
  runApp(MyApp());
}

// MyApp is a StatefulWidget. This allows updating the state of the widget
// when an item is removed.

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final appTitle = 'Dismissing Items';

  final items = List<String>.generate(20, (i) {
    return 'Item ${i + 1}';
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Dismissible(
                key: Key(item),
                onDismissed: (direction) {
                  setState(() {
                    items.removeAt(index);
                  });

                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('$item dismissed')));
                },
                background: Container(
                  color: Colors.red,
                ),
                child: ListTile(
                  title: Text('$item'),
                ),
              );
            }),
      ),
    );
  }
}
