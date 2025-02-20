import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_fome/main.dart' as app;
import 'package:flutter/material.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("Testando cenário 3 - o usuário edita sua loja virtual.",
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

    final goToEditing = find.byKey(const Key('goToEditing'));
    expect(goToEditing, findsOneWidget);
    await tester.tap(goToEditing);
    await tester.pumpAndSettle();

    final descriptionStoreUpdate =
        find.byKey(const Key('descriptionStoreUpdate'));
    final buttonUpdateStore = find.byKey(const Key('buttonUpdateStore'));
    expect(descriptionStoreUpdate, findsOneWidget);
    await tester.tap(descriptionStoreUpdate);
    await tester.enterText(descriptionStoreUpdate,
        'Os melhores pasteis da região você só encontra aqui na Pastelaria Favorita! Traga toda sua família e amigos e venham se deliciar.');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    expect(buttonUpdateStore, findsOneWidget);
    await tester.tap(buttonUpdateStore);
    await tester.pumpAndSettle();

    expect(messageButton, findsOneWidget);
    await tester.tap(messageButton);
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 3));
  });
}
