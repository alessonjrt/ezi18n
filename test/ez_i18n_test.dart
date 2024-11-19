// example/test/ez_i18n_test.dart
import 'dart:ui';

import 'package:ezi18n/ezi18n.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EzI18n Translation Tests', () {
    // Teste de tradução básica para 'en'
    test('Basic translation in English', () {
      final locale = Locale('en');
      final localizedStrings = {
        'app_title': 'Flutter Demo',
        'counter_message': 'You have pushed the button @{count} times',
        'increment': 'Increment',
      };
      final ezi18n = EzI18n(locale, localizedStrings);

      expect(ezi18n.tr('app_title'), 'Flutter Demo');
      expect(ezi18n.tr('counter_message', params: {'count': '5'}),
          'You have pushed the button 5 times');
      expect(ezi18n.tr('increment'), 'Increment');
    });

    // Teste de tradução básica para 'pt'
    test('Basic translation in Portuguese', () {
      final locale = Locale('pt');
      final localizedStrings = {
        'app_title': 'Demonstração do Flutter',
        'counter_message': 'Você pressionou o botão @{count} vezes',
        'increment': 'Incrementar',
      };
      final ezi18n = EzI18n(locale, localizedStrings);

      expect(ezi18n.tr('app_title'), 'Demonstração do Flutter');
      expect(ezi18n.tr('counter_message', params: {'count': '3'}),
          'Você pressionou o botão 3 vezes');
      expect(ezi18n.tr('increment'), 'Incrementar');
    });

    test('Basic translation in Portuguese (Brazil)', () {
      final locale = Locale('pt', 'BR');
      final localizedStrings = {
        'app_title': 'Demonstração do Flutter',
        'counter_message': 'Você pressionou o botão @{count} vezes, malandro',
        'increment': 'Incrementar',
      };
      final ezi18n = EzI18n(locale, localizedStrings);

      expect(ezi18n.tr('app_title'), 'Demonstração do Flutter');
      expect(ezi18n.tr('counter_message', params: {'count': '7'}),
          'Você pressionou o botão 7 vezes, malandro');
      expect(ezi18n.tr('increment'), 'Incrementar');
    });

    test('Translation key not found', () {
      final locale = Locale('en');
      final localizedStrings = {
        'greeting': 'Hello, @{name}!',
      };
      final ezi18n = EzI18n(locale, localizedStrings);

      expect(ezi18n.tr('farewell'), 'farewell'); // Retorna a própria chave
    });

    test('Parameter missing', () {
      final locale = Locale('en');
      final localizedStrings = {
        'greeting': 'Hello, @{name}!',
      };
      final ezi18n = EzI18n(locale, localizedStrings);

      expect(ezi18n.tr('greeting'),
          'Hello, !'); // Placeholder substituído por vazio
    });

    // Teste de múltiplos parâmetros
    test('Multiple parameters', () {
      final locale = Locale('en');
      final localizedStrings = {
        'unread_messages': '@{name}, you have @{count} unread messages.',
      };
      final ezi18n = EzI18n(locale, localizedStrings);

      expect(
          ezi18n.tr('unread_messages', params: {'name': 'Bob', 'count': '5'}),
          'Bob, you have 5 unread messages.');
    });

    // Teste de placeholders com caracteres especiais
    test('Placeholder with special characters', () {
      final locale = Locale('en');
      final localizedStrings = {
        'welcome': 'Welcome, @{first_name} @{last_name}!',
      };
      final ezi18n = EzI18n(locale, localizedStrings);

      expect(
          ezi18n.tr('welcome',
              params: {'first_name': 'John', 'last_name': 'Doe'}),
          'Welcome, John Doe!');
    });

    // Teste de fallback para localidade genérica quando a específica não está disponível
    test('Fallback to generic locale when specific locale not available', () {
      final specificLocale = Locale('pt', 'BR');
      final genericLocale = Locale('pt');
      final localizedStringsGeneric = {
        'app_title': 'Demonstração do Flutter',
        'counter_message': 'Você pressionou o botão @{count} vezes',
        'increment': 'Incrementar',
      };
      final localizedStringsSpecific = {
        'app_title': 'Demonstração do Flutter',
        'counter_message': 'Você pressionou o botão @{count} vezes, malandro',
        'increment': 'Incrementar',
      };

      // Simula o caso onde 'pt_BR' não está disponível
      final ezi18nFallback = EzI18n(specificLocale,
          localizedStringsGeneric); // Força uso de 'pt' sem 'pt_BR'

      expect(ezi18nFallback.tr('counter_message', params: {'count': '4'}),
          'Você pressionou o botão 4 vezes');
    });

    // Teste de fallback quando nenhuma localidade é encontrada
    test('Fallback when neither specific nor generic locale is available', () {
      final locale = Locale('es'); // Suportado?
      final localizedStrings = {
        'greeting': 'Hola, @{name}!',
      };
      final ezi18n = EzI18n(locale, localizedStrings);

      // Como 'es' não está definido, espera-se que retorne a própria chave
      expect(ezi18n.tr('farewell'), 'farewell');
    });

    // Teste de localidade com script (exemplo: 'zh_Hans')
    test('Locale with script', () {
      final locale = Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans');
      final localizedStrings = {
        'app_title': 'Flutter 演示',
        'counter_message': '你已点击按钮 @{count} 次',
        'increment': '增加',
      };
      final ezi18n = EzI18n(locale, localizedStrings);

      expect(ezi18n.tr('app_title'), 'Flutter 演示');
      expect(
          ezi18n.tr('counter_message', params: {'count': '10'}), '你已点击按钮 10 次');
      expect(ezi18n.tr('increment'), '增加');
    });

    // Teste de localidade com script e país
    test('Locale with script and country', () {
      final locale = Locale.fromSubtags(
          languageCode: 'zh', scriptCode: 'Hans', countryCode: 'CN');
      final localizedStrings = {
        'app_title': 'Flutter 演示',
        'counter_message': '你已点击按钮 @{count} 次',
        'increment': '增加',
      };
      final ezi18n = EzI18n(locale, localizedStrings);

      expect(ezi18n.tr('app_title'), 'Flutter 演示');
      expect(
          ezi18n.tr('counter_message', params: {'count': '15'}), '你已点击按钮 15 次');
      expect(ezi18n.tr('increment'), '增加');
    });

    // Teste de placeholders com números e símbolos
    test('Placeholders with numbers and symbols', () {
      final locale = Locale('en');
      final localizedStrings = {
        'promo_message':
            'Hello, @{name}! Use code @{code123} to get @{discount} off.',
      };
      final ezi18n = EzI18n(locale, localizedStrings);

      expect(
          ezi18n.tr('promo_message', params: {
            'name': 'Alice',
            'code123': 'DISCOUNT50',
            'discount': '50%'
          }),
          'Hello, Alice! Use code DISCOUNT50 to get 50% off.');
    });

    // Teste de placeholders aninhados (não suportado, mas para verificar comportamento)
    test('Nested placeholders (unsupported)', () {
      final locale = Locale('en');
      final localizedStrings = {
        'nested_placeholders': 'Value: @{outer_{inner}}',
      };
      final ezi18n = EzI18n(locale, localizedStrings);

      // Este caso não é suportado, então espera-se que o placeholder não seja substituído corretamente
      expect(
          ezi18n
              .tr('nested_placeholders', params: {'outer_{inner}': 'Success'}),
          'Value: Success');
    });
  });
}
