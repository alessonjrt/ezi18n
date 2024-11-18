import 'package:ezi18n/ezi18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EzI18n Tests', () {
    test('Translation with parameters', () {
      final locale = Locale('en');
      final localizedStrings = {
        'greeting': 'Hello, @{name}!',
      };
      final ezi18n = EzI18n(locale, localizedStrings);

      final result = ezi18n.tr('greeting', params: {'name': 'Alice'});
      expect(result, 'Hello, Alice!');
    });

    test('Translation key not found', () {
      final locale = Locale('en');
      final localizedStrings = {
        'greeting': 'Hello, @{name}!',
      };
      final ezi18n = EzI18n(locale, localizedStrings);

      final result = ezi18n.tr('farewell');
      expect(result, 'farewell');
    });

    test('Parameter missing', () {
      final locale = Locale('en');
      final localizedStrings = {
        'greeting': 'Hello, @{name}!',
      };
      final ezi18n = EzI18n(locale, localizedStrings);

      final result = ezi18n.tr('greeting');
      expect(result, 'Hello, !');
    });

    test('Multiple parameters', () {
      final locale = Locale('en');
      final localizedStrings = {
        'unread_messages': '@{name}, you have @{count} unread messages.',
      };
      final ezi18n = EzI18n(locale, localizedStrings);

      final result =
          ezi18n.tr('unread_messages', params: {'name': 'Bob', 'count': 5});
      expect(result, 'Bob, you have 5 unread messages.');
    });

    test('Placeholder with special characters', () {
      final locale = Locale('en');
      final localizedStrings = {
        'welcome': 'Welcome, @{first_name} @{last_name}!',
      };
      final ezi18n = EzI18n(locale, localizedStrings);

      final result = ezi18n
          .tr('welcome', params: {'first_name': 'John', 'last_name': 'Doe'});
      expect(result, 'Welcome, John Doe!');
    });
  });
}
