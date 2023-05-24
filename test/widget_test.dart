import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:help_remember/app_widget.dart';
import 'package:help_remember/widgets/menu_button.dart';

void main() {
  testWidgets('Test Widget', (WidgetTester tester) async {
    Future<void> _createWidget(WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        title: 'Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: AppWidget(),
      ));

      await tester.pump();
    }

    await _createWidget(tester);

    expect(find.byIcon(Icons.person), findsOneWidget);
  });

  testWidgets('Teste de widgets', (WidgetTester tester) async {
    Future<void> _createWidget(WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        title: 'Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: AppWidget(),
      ));

      await tester.pump();
    }
    await _createWidget(tester);
    //expect(find.byKey(Key('Person')), findsOneWidget);
    //await tester.tap(find.byType(IconButton));
    await tester.pump();
    expect(find.byType(MenuButton), findsWidgets);
  });
}
