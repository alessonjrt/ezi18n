import 'package:flutter/material.dart';
import 'ezi18n_base.dart';
import 'messages.dart';

class EzI18nDelegate extends LocalizationsDelegate<EzI18n> {
  final EzMessages messages;

  EzI18nDelegate(this.messages);

  @override
  bool isSupported(Locale locale) {
    return messages.keys.containsKey(locale.languageCode);
  }

  @override
  Future<EzI18n> load(Locale locale) async {
    return EzI18n(
      locale,
      messages.keys[locale.languageCode] ?? {},
    );
  }

  @override
  bool shouldReload(EzI18nDelegate old) => false;
}
