import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'package:intl/message_lookup_by_library.dart';
import 'package:intl/src/intl_helpers.dart';

import 'package:flutter_multi_language/message/message_en.dart';
import 'package:flutter_multi_language/message/message_th.dart';

typedef Future<dynamic> LibraryLoader();

class MyLocalizations {
  static Map<String, LibraryLoader> _libraries = {
    'en': () => Future.value(null),
    'th': () => Future.value(null),
    'messages': () => Future.value(null),
  };

  static Future<MyLocalizations> load(Locale locale) async {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

//    return initializeMessages(localeName).then((_) {
//      Intl.defaultLocale = localeName;
//      return MyLocalizations();
//    });

    print(name);

    await initializeMessages(localeName);
    Intl.defaultLocale = localeName;
    MyLocalizations localization = MyLocalizations();
    return localization;
  }

  static Future initializeMessages(String localeName) async {
    var lib = _libraries[Intl.canonicalizedLocale(localeName)];
    await (lib == null ? Future.value(false) : lib());
    initializeInternalMessageLookup(() => CompositeMessageLookup());
    messageLookup.addLocale(localeName, _findGeneratedMessagesFor);
  }

  static MessageLookupByLibrary _findGeneratedMessagesFor(locale) {
    var actualLocale =
        Intl.verifiedLocale(locale, _messagesExistFor, onFailure: (_) => null);
    if (actualLocale == null) return null;
    return _findExact(actualLocale);
  }

  static bool _messagesExistFor(String locale) {
    try {
      return _findExact(locale) != null;
    } catch (e) {
      return false;
    }
  }

  static MessageLookupByLibrary _findExact(localeName) {
    switch (localeName) {
      case 'en':
        return MessageLookupEn();
      case 'th':
        return MessageLookupTh();
      default:
        return null;
    }
  }

  static MyLocalizations of(BuildContext context) {
    return Localizations.of<MyLocalizations>(context, MyLocalizations);
  }

  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: 'Title for the Demo application',
    );
  }

  String get yourLocale {
    return Intl.message(
      'Your locale',
      name: 'your_locale',
    );
  }

  String  totalItems(int count) {

    return Intl.message(
      'total',
      name: 'total_items',
      args: [count]
    );
  }


}
