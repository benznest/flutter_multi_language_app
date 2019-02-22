import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_multi_language/my_localizations.dart';
import 'package:flutter_multi_language/my_localizations_delegate.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale locale;

  @override
  void initState() {
    super.initState();
    locale = Locale('en', 'US');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        MyLocalizationsDelegate.delegate,
      ],
      supportedLocales: [
        const Locale('th', 'TH'), // Thai
        const Locale('en', 'US'), // English
      ],
      locale: locale,
      title: 'Multi-Languages App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Multi-Languages App',
        onLanguageChanged: (newLocale) {
          setState(() {
            locale = newLocale;
          });
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final Function(Locale) onLanguageChanged;

  MyHomePage({Key key, this.title, @required this.onLanguageChanged})
      : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(MyLocalizations.of(context).yourLocale,
                style: TextStyle(fontSize: 20)),
            Text(
              myLocale.languageCode,
              style: TextStyle(fontSize: 36),
            ),
            Text(
              MyLocalizations.of(context).totalItems(62),
              style: TextStyle(fontSize: 28),
            ),
            Text(
              MyLocalizations.of(context).totalItems(1),
              style: TextStyle(fontSize: 28),
            ),
            Text(
              MyLocalizations.of(context).totalItems(0),
              style: TextStyle(fontSize: 28),
            ),
            Container(
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      padding: EdgeInsets.all(16),
                      color: Colors.green[300],
                      child: Text("English",
                          style: TextStyle(fontSize: 36, color: Colors.white)),
                      onPressed: () {
                        widget.onLanguageChanged(Locale("en", "US"));
                      },
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(16),
                      color: Colors.red[300],
                      child: Text("ภาษาไทย",
                          style: TextStyle(fontSize: 30, color: Colors.white)),
                      onPressed: () {
                        widget.onLanguageChanged(Locale("th", "TH"));
                      },
                    )
                  ],
                )),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
