// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class DrawerDefault extends StatelessWidget {
  final void Function() home;
  final void Function() myLocation;
  final void Function() product;
  final void Function() store;
  final void Function() myAccount;
  final void Function() logout;
  final String homeText;
  final String myLocationText;
  final String productText;
  final String storeText;
  final String myAccountText;
  final String logoutText;
  
  const DrawerDefault({
    super.key,
    required this.home,
    required this.myLocation,
    required this.product,
    required this.store,
    required this.myAccount,
    required this.logout,
    required this.homeText,
    required this.myLocationText,
    required this.productText,
    required this.storeText,
    required this.myAccountText,
    required this.logoutText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            MenuItem(
              text: homeText,
              icon: const Icon(Icons.home_outlined),
              onPressed: home,
            ),
            MenuItem(
              text: myLocationText,
              icon: const Icon(Icons.fmd_good_outlined),
              onPressed: myLocation,
            ),
            MenuItem(
              text: myAccountText,
              icon: const Icon(Icons.person_pin_outlined),
              onPressed: myAccount,
            ),
            const DividerDefault(),
            MenuItem(
              text: productText,
              icon: const Icon(Icons.sell_outlined),
              onPressed: product,
            ),
            MenuItem(
              text: storeText,
              icon: const Icon(Icons.store_mall_directory_outlined),
              onPressed: product,
            ),
          ],
        ),
        Column(
          children: [
            const DividerDefault(),
            MenuItem(
              text: logoutText,
              icon: const Icon(Icons.logout),
              onPressed: logout,
            ),
            const SizedBox(
              height: Scale.xxs,
            ),
          ],
        ),
      ],
    );
  }
}
