import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_fome/main.dart' as app;
import 'package:flutter/material.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Testando cenário 4 - o usuário cria novos produtos.",
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

    final goToProductRegister = find.byKey(const Key('goToProductRegister'));
    expect(goToProductRegister, findsOneWidget);
    await tester.tap(goToProductRegister);
    await tester.pumpAndSettle();

    final imageProductRegister = find.byKey(const Key('imageProductRegister'));
    final nameProductRegister = find.byKey(const Key('nameProductRegister'));
    final descriptionProductRegister =
        find.byKey(const Key('descriptionProductRegister'));
    final priceProductRegister = find.byKey(const Key('priceProductRegister'));
    final amountProductRegister =
        find.byKey(const Key('amountProductRegister'));
    final buttonRegisterProduct =
        find.byKey(const Key('buttonRegisterProduct'));
    expect(imageProductRegister, findsOneWidget);
    await tester.tap(imageProductRegister);
    await tester.pump();
    await tester.runAsync(() async {
      while (find.byType(Image).evaluate().isEmpty) {
        await tester.pump();
      }
    });
    await tester.pumpAndSettle();
    await tester.tap(nameProductRegister);
    await tester.enterText(
        nameProductRegister, 'Pastel de Frango com Catupiry 250g');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    expect(descriptionProductRegister, findsOneWidget);
    await tester.tap(descriptionProductRegister);
    await tester.enterText(nameProductRegister,
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    expect(priceProductRegister, findsOneWidget);
    await tester.tap(priceProductRegister);
    await tester.enterText(priceProductRegister, '500');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    expect(amountProductRegister, findsOneWidget);
    await tester.tap(amountProductRegister);
    await tester.enterText(amountProductRegister, '10');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    expect(buttonRegisterProduct, findsOneWidget);
    await tester.tap(buttonRegisterProduct);
    await tester.pumpAndSettle();

    expect(messageButton, findsOneWidget);
    await tester.tap(messageButton);
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 3));
  });
}
