import 'package:example/main.dart';
import 'package:example/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments and displays translated messages',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(
      messages: AppMessages(),
      supportedLocales: [
        Locale('en', ''),
        Locale('pt', 'BR'),
      ],
      locale: Locale('en'),
    ));

    await tester.pumpAndSettle();

    final String initialMessage = 'You have pushed the button 0 times';
    final String incrementedMessage = 'You have pushed the button 1 times';

    expect(find.text(initialMessage), findsOneWidget);

    expect(find.text(incrementedMessage), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    expect(find.text(initialMessage), findsNothing);

    expect(find.text(incrementedMessage), findsOneWidget);
  });

  testWidgets(
      'Counter increments and displays translated messages, but with pt_BR',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(
      messages: AppMessages(),
      supportedLocales: [
        Locale('en', ''),
        Locale('pt', 'BR'),
      ],
      locale: Locale('pt', 'BR'),
    ));

    await tester.pumpAndSettle();

    final String initialMessage = 'Você pressionou o botão 0 vezes, malandro';
    final String incrementedMessage =
        'Você pressionou o botão 1 vezes, malandro';

    expect(find.text(initialMessage), findsOneWidget);

    expect(find.text(incrementedMessage), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    expect(find.text(initialMessage), findsNothing);

    expect(find.text(incrementedMessage), findsOneWidget);
  });
}
