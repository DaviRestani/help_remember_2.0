import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:help_remember/app_widget.dart';

import 'package:help_remember/main.dart';
import 'package:help_remember/widgets/menu_button.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

void main() {
  testWidgets('Teste de verificação do widget para ir para a tela de Login', (WidgetTester tester) async {
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

  testWidgets('Teste de localização do widget Menu Button', (WidgetTester tester) async {
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

