// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:help_remember/app_widget.dart';
import 'package:help_remember/screens/cadastro_screen.dart';
import 'package:help_remember/screens/login_screen.dart';

void main() {
  testWidgets('Navigation Menu to Family Test', (WidgetTester tester) async {
    // Construir o aplicativo e acionar o pumpWidget
    await tester.pumpWidget(const AppWidget());

    // Verificar se a página inicial está sendo exibida
    expect(find.text('Menu Principal'), findsOneWidget);

    // Encontrar e pressionar o botão "Familia"
    await tester.tap(find.text('Família'));
    await tester.pump();

    // Verificar se a segunda página está sendo exibida
    expect(find.text('Família'), findsOneWidget);
  });

  testWidgets('Navigation Family to Create Family Test', (WidgetTester tester) async {
    // Construir o aplicativo e acionar o pumpWidget
    await tester.pumpWidget(const AppWidget());

    // Verificar se a página inicial está sendo exibida
    expect(find.text('Menu Principal'), findsOneWidget);

    // Encontrar e pressionar o botão "Familia"
    await tester.tap(find.text('Família'));
    await tester.pumpAndSettle();

    // Verificar se a segunda página está sendo exibida
    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    expect(find.text('Adicionar Ente'), findsOneWidget);
  });
}
