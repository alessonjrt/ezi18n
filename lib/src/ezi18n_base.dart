import 'dart:developer';

import 'package:flutter/material.dart';

import 'errors/not_found_in_context.dart';

class EzI18n {
  final Locale locale;
  final Map<String, String> localizedStrings;

  EzI18n(this.locale, this.localizedStrings);

  /// Function to get the localized string with support for parameters using `@{paramKey}`.
  String tr(String key, {Map<String, dynamic>? params}) {
    String translation = localizedStrings[key] ?? key;

    if (!localizedStrings.containsKey(key)) {
      log(
        'Translation key "$key" not found for locale "${locale.toString()}".',
        name: 'EzI18n',
      );
    }

    // Regular expression to match placeholders in the format @{paramKey}
    final parameterRegExp = RegExp(r'@\{([^}]+)\}');

    translation = translation.replaceAllMapped(parameterRegExp, (match) {
      final placeholder = match.group(1)?.trim();
      if (placeholder != null &&
          params != null &&
          params.containsKey(placeholder)) {
        return params[placeholder]?.toString() ?? '';
      } else {
        log(
          'Missing parameter "@{$placeholder}" for key "$key".',
          name: 'EzI18n',
        );
        // Decide whether to keep the placeholder or replace it with an empty string
        return '';
      }
    });

    return translation;
  }

  /// Static method to access EzI18n from the context.
  static EzI18n of(BuildContext context) {
    final ezi18n = Localizations.of<EzI18n>(context, EzI18n);
    if (ezi18n == null) {
      throw EzNotFoundInContext();
    }
    return ezi18n;
  }
}
