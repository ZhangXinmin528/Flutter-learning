import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterdemo/l10n/intl_localizations.dart';

//使用Intl进行国际化
//TODO:存在问题找不到Title
void main() {
  runApp(IntlDemoApp());
}

class IntlDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      onGenerateTitle: (BuildContext context) {
        return IntlDemoLocalizations.of(context).title;
      },
      localizationsDelegates: [
        const IntlDemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
      ],
      home: Scaffold(
        appBar: AppBar(
          title: Text(IntlDemoLocalizations.of(context).title),
        ),
        body: Center(
          child: Text(IntlDemoLocalizations.of(context).title),
        ),
      ),
    );
  }
}
