import 'package:integration_test/integration_test.dart';
import 'package:my_fome/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("Testando cenário 9 - o usuário realiza um pedido.",
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    final drawerButton = find.byKey(const Key('drawerButton'));
    expect(drawerButton, findsOneWidget);
    await tester.tap(drawerButton);
    await tester.pumpAndSettle();

    final productsNavigator = find.byKey(const Key('productsNavigator'));
    expect(productsNavigator, findsOneWidget);
    await tester.tap(productsNavigator);
    await tester.pumpAndSettle();

    final selectItemProduct = find.byKey(const Key('selectItemProduct')).at(0);
    expect(selectItemProduct, findsOneWidget);
    await tester.tap(selectItemProduct);
    await tester.pumpAndSettle();

    final openAlertOrder = find.byKey(const Key('openAlertOrder'));
    expect(openAlertOrder, findsOneWidget);
    await tester.tap(openAlertOrder);
    await tester.pumpAndSettle();

    final incrementProductOnOrder =
        find.byKey(const Key('incrementProductOnOrder'));
    final finalizeOrder = find.byKey(const Key('finalizeOrder'));
    expect(incrementProductOnOrder, findsOneWidget);
    await tester.tap(incrementProductOnOrder);
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(incrementProductOnOrder);
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 1));
    expect(finalizeOrder, findsOneWidget);
    await tester.tap(finalizeOrder);
    await tester.pumpAndSettle();

    await tester.pump(const Duration(seconds: 3));
  });
}
