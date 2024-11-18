import 'dart:developer';
import 'package:flutter/material.dart';

class EzI18n {
  final Locale locale;
  final Map<String, String> localizedStrings;

  EzI18n(this.locale, this.localizedStrings);

  /// Função para obter a string localizada com suporte a parâmetros usando `@{paramKey}`.
  String tr(String key, {Map<String, dynamic>? params}) {
    String translation = localizedStrings[key] ?? key;

    if (!localizedStrings.containsKey(key)) {
      log(
        'Translation key "$key" not found for locale "${locale.toString()}".',
        name: 'EzI18n',
      );
    }

    // Expressão regular para corresponder a placeholders no formato @{paramKey}
    final parameterRegExp = RegExp(r'@\{([^}]+)\}');

    translation = translation.replaceAllMapped(parameterRegExp, (match) {
      final placeholder = match.group(1)?.trim();
      if (placeholder != null && params != null && params.containsKey(placeholder)) {
        return params[placeholder]?.toString() ?? '';
      } else {
        log(
          'Missing parameter "@{$placeholder}" for key "$key".',
          name: 'EzI18n',
        );
        // Decide se mantém o placeholder ou substitui por uma string vazia
        return '';
      }
    });

    return translation;
  }

  /// Método estático para acessar EzI18n a partir do contexto.
  static EzI18n of(BuildContext context) {
    final ezi18n = Localizations.of<EzI18n>(context, EzI18n);
    if (ezi18n == null) {
      throw Exception('EzI18n not found in context. Ensure EzI18nDelegate is added to localizationsDelegates.');
    }
    return ezi18n;
  }
}
