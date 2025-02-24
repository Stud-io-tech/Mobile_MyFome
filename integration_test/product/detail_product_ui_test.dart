import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_fome/main.dart' as app;
import 'package:flutter/material.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Testando cenário 5 - o usuário filtra dados de seus produtos.",
      (WidgetTester tester) async {
    app.main();

    await tester.pumpAndSettle();
    final loginButton = find.byKey(const Key('loginButton'));
    expect(loginButton, findsOneWidget);
    await tester.tap(loginButton);
    await tester.pumpAndSettle();
    
    final messageButton = find.byKey(const Key('messageButton'));
    expect(messageButton, findsOneWidget);
    await tester.tap(messageButton);
    await tester.pumpAndSettle();

    final drawerButton = find.byKey(const Key('drawerButton'));
    final myStoreNavigator = find.byKey(const Key('myStoreNavigator'));
    expect(drawerButton, findsOneWidget);
    await tester.tap(drawerButton);
    await tester.pumpAndSettle();
    expect(myStoreNavigator, findsOneWidget);
    await tester.tap(myStoreNavigator);
    await tester.pumpAndSettle();

    final goToMyProducts = find.byKey(const Key('goToMyProducts'));
    expect(goToMyProducts, findsOneWidget);
    await tester.tap(goToMyProducts);
    await tester.pumpAndSettle();

    final selectItemProduct = find.byKey(const Key('selectItemProduct')).at(0);
    expect(selectItemProduct, findsOneWidget);
    await tester.tap(selectItemProduct);
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 3));
  });
}
