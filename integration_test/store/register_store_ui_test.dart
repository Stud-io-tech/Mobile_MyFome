import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_fome/main.dart' as app;
import 'package:flutter/material.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Testando cenário 2 - o usuário cadastra sua loja virtual.",
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

    final imageStoreRegister = find.byKey(const Key('imageStoreRegister'));
    final nameStoreRegister = find.byKey(const Key('nameStoreRegister'));
    final descriptionStoreRegister =
        find.byKey(const Key('descriptionStoreRegister'));
    final whatsappStoreRegister =
        find.byKey(const Key('whatsappStoreRegister'));
    final buttonRegisterStore = find.byKey(const Key('buttonRegisterStore'));
    expect(imageStoreRegister, findsOneWidget);
    await tester.tap(imageStoreRegister);
    await tester.pump();
    await tester.runAsync(() async {
      while (find.byType(Image).evaluate().isEmpty) {
        await tester.pump();
      }
    });
    await tester.pumpAndSettle();
    await tester.tap(nameStoreRegister);
    await tester.enterText(nameStoreRegister, 'Pastelaria Favorita');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    expect(descriptionStoreRegister, findsOneWidget);
    await tester.tap(descriptionStoreRegister);
    await tester.enterText(nameStoreRegister,
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    expect(whatsappStoreRegister, findsOneWidget);
    await tester.tap(whatsappStoreRegister);
    await tester.enterText(whatsappStoreRegister, '84992017118');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    expect(buttonRegisterStore, findsOneWidget);
    await tester.tap(buttonRegisterStore);
    await tester.pumpAndSettle();

    expect(messageButton, findsOneWidget);
    await tester.tap(messageButton);
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 3));
  });
}
