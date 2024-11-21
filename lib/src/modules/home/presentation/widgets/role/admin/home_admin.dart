import 'package:my_fome/src/modules/home/presentation/widgets/card/group_select_menu_card.dart';
import 'package:my_fome/uikit/lib/uikit.dart';
import 'package:flutter/material.dart';

import '../../card/initial_happy_card.dart';

class HomeAdmin extends StatelessWidget {
  const HomeAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const InitialHappyCard(),
        const SizedBox(
          height: Scale.md,
        ),
        GroupSelectMenuCard()
      ],
    );
  }
}
