import 'package:ezi18n/ezi18n.dart';
import 'package:flutter/material.dart';

import 'errors/not_found_in_context.dart';

class EzI18nDelegate extends LocalizationsDelegate<EzI18n> {
  final EzMessages messages;

  EzI18nDelegate(this.messages);

  @override
  bool isSupported(Locale locale) {
    String localeKey = _getLocaleKey(locale);
    return messages.keys.containsKey(localeKey);
  }

  @override
  Future<EzI18n> load(Locale locale) async {
    String localeKey = _getLocaleKey(locale);
    Map<String, String>? localizedStrings = messages.keys[localeKey];

    if (localizedStrings == null &&
        locale.countryCode != null &&
        locale.countryCode!.isNotEmpty) {
      localeKey = locale.languageCode;
      localizedStrings = messages.keys[localeKey];
    }

    if (localizedStrings == null) {
      throw EzNotFoundInContext();
    }

    return EzI18n(
      locale,
      localizedStrings,
    );
  }

  String _getLocaleKey(Locale locale) {
    if (locale.countryCode != null &&
        (locale.countryCode != null && locale.countryCode!.isNotEmpty)) {
      return '${locale.languageCode}_${locale.countryCode}';
    }
    return locale.languageCode;
  }

  @override
  bool shouldReload(EzI18nDelegate old) => false;
}
