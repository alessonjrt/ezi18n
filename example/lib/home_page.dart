import 'package:ezi18n/ezi18n.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final Function(Locale newLocale) onChangeLanguage;
  final List<Locale> supportedLocales;
  final Locale currentLocale;

  MyHomePage({
    Key? key,
    required this.onChangeLanguage,
    required this.supportedLocales,
    required this.currentLocale,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget _buildLanguageDropdown() {
    return DropdownButton<Locale>(
      value: widget.currentLocale,
      icon: Icon(Icons.language, color: Colors.white),
      dropdownColor: Colors.blue,
      underline: Container(),
      onChanged: (Locale? newLocale) {
        if (newLocale != null) {
          widget.onChangeLanguage(newLocale);
        }
      },
      items: widget.supportedLocales
          .map<DropdownMenuItem<Locale>>((Locale locale) {
        String languageText;
        switch (locale.languageCode) {
          case 'en':
            languageText = 'English';
            break;
          case 'pt':
            languageText = 'Português';
            break;
          default:
            languageText = locale.languageCode;
        }
        return DropdownMenuItem<Locale>(
          value: locale,
          child: Text(
            languageText,
            style: TextStyle(color: Colors.white),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app_title'.tr(context)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildLanguageDropdown(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('counter_message'.tr(context, params: {'count': '$_counter'})),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'increment'.tr(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
