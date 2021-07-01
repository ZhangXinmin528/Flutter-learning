import 'package:flutter/material.dart';
import 'package:flutterdemo/l10n/messages_all.dart';
import 'package:intl/intl.dart';

class IntlDemoLocalizations {
  IntlDemoLocalizations(this.localeName);

  static Future<IntlDemoLocalizations> load(Locale locale) {

    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    print(
        'the local code of $localeName ${locale.countryCode.isEmpty} ${locale}');

    return initializeMessages(localeName).then((_) {
      return IntlDemoLocalizations(localeName);
    });
  }

  static IntlDemoLocalizations of(BuildContext context) {
    return Localizations.of<IntlDemoLocalizations>(
        context, IntlDemoLocalizations);
  }

  final String localeName;

  String get title {
    return Intl.message(
      'Hello World',
      name: 'title',
      desc: 'Title for the Demo application',
      locale: localeName,
    );
  }
}

class IntlDemoLocalizationsDelegate
    extends LocalizationsDelegate<IntlDemoLocalizations> {
  const IntlDemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<IntlDemoLocalizations> load(Locale locale) {
    return IntlDemoLocalizations.load(locale);
  }

  @override
  bool shouldReload(IntlDemoLocalizationsDelegate old) => false;
}
