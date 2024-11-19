// example/test/widget_translation_test.dart
import 'package:example/main.dart';
import 'package:example/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Widget Translation Tests', () {
    testWidgets('Displays correct translation for pt',
        (WidgetTester tester) async {
      await tester.pumpWidget(MyApp(
        messages: AppMessages(),
        supportedLocales: [
          Locale('en', ''),
          Locale('pt', ''),
          Locale('pt', 'BR'),
        ],
        locale: Locale('pt', ''),
      ));

      await tester.pumpAndSettle();

      expect(find.text('Demonstração do Flutter'), findsOneWidget);
      expect(find.text('Você pressionou o botão 0 vezes'), findsOneWidget);
      expect(find.text('Incrementar'), findsOneWidget);
      expect(find.text('Você pressionou o botão 1 vezes'), findsNothing);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      expect(find.text('Você pressionou o botão 0 vezes'), findsNothing);
      expect(find.text('Você pressionou o botão 1 vezes'), findsOneWidget);
    });

    testWidgets('Displays correct translation for pt_BR',
        (WidgetTester tester) async {
      await tester.pumpWidget(MyApp(
        messages: AppMessages(),
        supportedLocales: [
          Locale('en', ''),
          Locale('pt', ''),
          Locale('pt', 'BR'),
        ],
        locale: Locale('pt', 'BR'),
      ));

      await tester.pumpAndSettle();

      expect(find.text('Demonstração do Flutter'), findsOneWidget);
      expect(find.text('Você pressionou o botão 0 vezes, malandro'),
          findsOneWidget);
      expect(find.text('Incrementar'), findsOneWidget);
      expect(
          find.text('Você pressionou o botão 1 vezes, malandro'), findsNothing);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      expect(
          find.text('Você pressionou o botão 0 vezes, malandro'), findsNothing);
      expect(find.text('Você pressionou o botão 1 vezes, malandro'),
          findsOneWidget);
    });

    testWidgets('Fallback to pt when pt_BR is not available',
        (WidgetTester tester) async {
      await tester.pumpWidget(MyApp(
        messages: AppMessages(),
        supportedLocales: [
          Locale('en', ''),
          Locale('pt', ''),
        ],
        locale: Locale('pt', 'BR'), // pt_BR not supported
      ));

      await tester.pumpAndSettle();

      expect(find.text('Demonstração do Flutter'), findsOneWidget);
      expect(find.text('Você pressionou o botão 0 vezes'), findsOneWidget);
      expect(find.text('Incrementar'), findsOneWidget);
      expect(
          find.text('Você pressionou o botão 1 vezes, malandro'), findsNothing);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      expect(find.text('Você pressionou o botão 0 vezes'), findsNothing);
      expect(find.text('Você pressionou o botão 1 vezes'), findsOneWidget);
    });

    testWidgets('Displays correct translation for en',
        (WidgetTester tester) async {
      await tester.pumpWidget(MyApp(
        messages: AppMessages(),
        supportedLocales: [
          Locale('en', ''),
          Locale('pt', ''),
          Locale('pt', 'BR'),
        ],
        locale: Locale('en', ''),
      ));

      await tester.pumpAndSettle();

      expect(find.text('Flutter Demo'), findsOneWidget);
      expect(find.text('You have pushed the button 0 times'), findsOneWidget);
      expect(find.text('Increment'), findsOneWidget);
      expect(find.text('You have pushed the button 1 times'), findsNothing);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      expect(find.text('You have pushed the button 0 times'), findsNothing);
      expect(find.text('You have pushed the button 1 times'), findsOneWidget);
    });
  });
}
