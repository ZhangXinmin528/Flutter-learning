import 'package:flutter/material.dart';

void main() {
  runApp(HeroApp());
}

class HeroApp extends StatelessWidget {
  final appTitle = 'Transition Demo';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: appTitle,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: GestureDetector(
        child: Hero(
            tag: 'imageHero',
            child: Image.network('https://picsum.photos/250?image=9')),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return DetialScreen();
              },
            ),
          );
        },
      ),
    );
  }
}

class DetialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
              tag: 'imageHero',
              child: Image.network('https://picsum.photos/250?image=9')),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
