import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DemoLocalizations {
  final String localName;

  DemoLocalizations(this.localName);

  static Future<DemoLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();

    final String localName = Intl.canonicalizedLocale(name);

    return null;
  }

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  String get title {
    return Intl.message(
      'Hello World',
      name: 'title',
      desc: 'Title for the demo application',
      locale: localName,
    );
  }
}

class DemoLocalizationsDelgate extends LocalizationsDelegate<DemoLocalizations>{
  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return null;
  }

  @override
  Future<DemoLocalizations> load(Locale locale) {
    // TODO: implement load
    return null;
  }

  @override
  bool shouldReload(LocalizationsDelegate<DemoLocalizations> old) {
    // TODO: implement shouldReload
    return null;
  }

}


