// lib/main.dart
import 'package:example/messages.dart';
import 'package:ezi18n/ezi18n.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp(
    messages: AppMessages(),
    supportedLocales: [
      Locale('en', ''),
      Locale('pt', ''),
    ],
    locale: Locale('pt', 'BR'),
  ));
}

class MyApp extends StatefulWidget {
  final Locale locale;
  final EzMessages messages;
  final List<Locale> supportedLocales;

  MyApp(
      {required this.messages,
      required this.supportedLocales,
      required this.locale});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _currentLocale;

  _MyAppState() : _currentLocale = Locale('en', '');

  @override
  void initState() {
    _currentLocale = widget.locale;
    super.initState();
  }

  void _changeLanguage(Locale locale) {
    setState(() {
      _currentLocale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _currentLocale,
      localizationsDelegates: [
        EzI18nDelegate(widget.messages),
      ],
      supportedLocales: widget.supportedLocales,
      home: MyHomePage(
        onChangeLanguage: _changeLanguage,
        supportedLocales: widget.supportedLocales,
        currentLocale: _currentLocale,
      ),
    );
  }
}
