import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///ListTitle使用示例
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String _title = 'ListTile widget example';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: _buildListTileWidget(),
      ),
    );
  }

  Widget _buildListTileWidget() {
    return new Container(
      child: ListView(
        children: <Widget>[
          Card(child: ListTile(title: Text('One-line ListTile'))),
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('One-line with leading widget'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('One-line with trailing widget'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('One-line with both widgets'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('One-line dense ListTile'),
              dense: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(
                size: 56.0,
              ),
              title: Text('Two-line ListTile'),
              subtitle: Text('Here is a second line'),
              trailing: Icon(Icons.move_to_inbox),
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(
                size: 72.0,
              ),
              title: Text('Three-line ListTile'),
              subtitle:
                  Text('A sufficiently long subtitle warrants three lines.'),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          )
        ],
      ),
    );
  }
}
