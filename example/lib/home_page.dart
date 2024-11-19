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

  void _showLanguageSelector() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'select_language'.tr(context),
              ),
              const SizedBox(height: 16),
              ListView(
                shrinkWrap: true,
                children: widget.supportedLocales.map((locale) {
                  final isSelected = locale == widget.currentLocale;
                  return ListTile(
                    leading: isSelected
                        ? Icon(Icons.check, color: Colors.blue)
                        : null,
                    title: Text(locale.languageCode +
                        (locale.countryCode != null
                            ? ' - ${locale.countryCode}'
                            : '')),
                    onTap: () {
                      widget.onChangeLanguage(locale);
                      Navigator.pop(context);
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageDropdown() {
    return IconButton(
      icon: Icon(Icons.language, color: Colors.blue),
      onPressed: _showLanguageSelector,
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
