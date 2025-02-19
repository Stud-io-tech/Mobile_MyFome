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
    final myStoreNavigator = find.byKey(const Key('myStoreNavigator'));
    expect(drawerButton, findsOneWidget);
    await tester.tap(drawerButton);
    await tester.pumpAndSettle();
    expect(myStoreNavigator, findsOneWidget);
    await tester.tap(myStoreNavigator);
    await tester.pumpAndSettle();

    final imageProductRegister = find.byKey(const Key('imageProductRegister'));
    final nameProductRegister = find.byKey(const Key('nameProductRegister'));
    final descriptionProductRegister =
        find.byKey(const Key('descriptionProductRegister'));
    final whatsappProductRegister =
        find.byKey(const Key('whatsappProductRegister'));
    final buttonRegisterStore = find.byKey(const Key('buttonRegisterStore'));
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
    await tester.enterText(nameProductRegister, 'Pastelaria Favorita');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    expect(descriptionProductRegister, findsOneWidget);
    await tester.tap(descriptionProductRegister);
    await tester.enterText(nameProductRegister,
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    expect(whatsappProductRegister, findsOneWidget);
    await tester.tap(whatsappProductRegister);
    await tester.enterText(whatsappProductRegister, '84992017118');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    expect(buttonRegisterStore, findsOneWidget);
    await tester.tap(buttonRegisterStore);
    await tester.pumpAndSettle();
    expect(messageButton, findsOneWidget);
    await tester.tap(messageButton);
    await tester.pumpAndSettle();
  });
}
