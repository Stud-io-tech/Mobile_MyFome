import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_fome/main.dart' as app;
import 'package:flutter/material.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Testando cenário 8 - o usuário reativa um produto.",
      (WidgetTester tester) async {
    app.main();

    await tester.pumpAndSettle();
    final loginButton = find.byKey(const Key('loginButton'));
    final messageButton = find.byKey(const Key('messageButton'));
    expect(loginButton, findsOneWidget);
    await tester.tap(loginButton);
    await tester.pumpAndSettle();
    expect(messageButton, findsOneWidget);
    await tester.tap(messageButton);
    await tester.pumpAndSettle();

    final drawerButton = find.byKey(const Key('drawerButton'));
    expect(drawerButton, findsOneWidget);
    await tester.tap(drawerButton);
    await tester.pumpAndSettle();

    final myStoreNavigator = find.byKey(const Key('myStoreNavigator'));
    expect(myStoreNavigator, findsOneWidget);
    await tester.tap(myStoreNavigator);
    await tester.pumpAndSettle();

    final goToMyProducts = find.byKey(const Key('goToMyProducts'));
    expect(goToMyProducts, findsOneWidget);
    await tester.tap(goToMyProducts);
    await tester.pumpAndSettle();

    final buttonSuspendedProducts =
        find.byKey(const Key('buttonSuspendedProducts'));
    await tester.tap(buttonSuspendedProducts);
    await tester.pumpAndSettle();

    final openModalConfirmProduct =
        find.byKey(const Key('openModalConfirmProduct')).at(0);
    expect(openModalConfirmProduct, findsOneWidget);
    await tester.tap(openModalConfirmProduct);
    await tester.pumpAndSettle();

    final confirm = find.byKey(const Key('confirm'));
    expect(confirm, findsOneWidget);
    await tester.tap(confirm);
    await tester.pumpAndSettle();

    expect(messageButton, findsOneWidget);
    await tester.tap(messageButton);
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 3));
  });
}
