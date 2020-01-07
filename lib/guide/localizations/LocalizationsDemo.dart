import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class DemoLocalizations {
  final Locale locale;

  DemoLocalizations(this.locale);

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Hello World',
    },
    'es': {
      'title': 'Hola Mundo',
    },
    'zh': {
      'title': '你好~',
    }
  };

  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }
}

class DemoLocalozationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalozationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return ['en', 'es', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<DemoLocalizations> load(Locale locale) {
    // TODO: implement load
    return SynchronousFuture<DemoLocalizations>(DemoLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<DemoLocalizations> old) {
    // TODO: implement shouldReload
    return false;
  }
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(DemoLocalizations.of(context).title),
      ),
      body: Center(
        child: Text(DemoLocalizations.of(context).title),
      ),
    );
  }
}

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      onGenerateTitle: (BuildContext context) {
        return DemoLocalizations.of(context).title;
      },
      localizationsDelegates: [
        const DemoLocalozationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
        const Locale('zh', ''),
      ],
      home: DemoApp(),
    );
  }
}

void main() {
  runApp(Demo());
}
