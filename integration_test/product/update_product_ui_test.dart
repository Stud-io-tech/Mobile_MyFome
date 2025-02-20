import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_fome/main.dart' as app;
import 'package:flutter/material.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("Testando cenário 6 - o usuário edita sua loja virtual.",
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

    final selectItemProduct = find.byKey(const Key('selectItemProduct')).at(0);
    expect(selectItemProduct, findsOneWidget);
    await tester.tap(selectItemProduct);
    await tester.pumpAndSettle();

    final goToEditing = find.byKey(const Key('goToEditing'));
    expect(goToEditing, findsOneWidget);
    await tester.tap(goToEditing);
    await tester.pumpAndSettle();

    final descriptionProductUpdate =
        find.byKey(const Key('descriptionProductUpdate'));
    final priceProductUpdate = find.byKey(const Key('priceProductUpdate'));
    final amountProductUpdate = find.byKey(const Key('amountProductUpdate'));
    final buttonUpdateProduct = find.byKey(const Key('buttonUpdateProduct'));
    expect(descriptionProductUpdate, findsOneWidget);
    await tester.tap(descriptionProductUpdate);
    await tester.enterText(descriptionProductUpdate,
        'Delicioso pastel de frango com catupiry de 250g! Contém gluten e derivados do leite.');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    expect(priceProductUpdate, findsOneWidget);
    await tester.tap(priceProductUpdate);
    await tester.enterText(priceProductUpdate, '450');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    expect(amountProductUpdate, findsOneWidget);
    await tester.tap(amountProductUpdate);
    await tester.enterText(amountProductUpdate, '21');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    expect(buttonUpdateProduct, findsOneWidget);
    await tester.tap(buttonUpdateProduct);
    await tester.pumpAndSettle();
    expect(messageButton, findsOneWidget);
    await tester.tap(messageButton);
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 3));
  });
}
