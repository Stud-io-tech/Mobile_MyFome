import 'package:my_fome/src/core/constants/text_constant.dart';
import 'package:my_fome/src/core/controllers/route/route_controller.dart';
import 'package:my_fome/src/modules/home/presentation/widgets/card/select_menu_item.dart';
import 'package:my_fome/uikit/lib/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class GroupSelectMenuCard extends StatelessWidget {
  GroupSelectMenuCard({super.key});

  final routeController = Injector.get<RouteController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height - 320,
        width: double.infinity,
        child: CardDefault(
            child: Padding(
                padding: const EdgeInsets.all(Scale.xs),
                child: Expanded(
                  child: SelectMenuItem(
                    icon: Icons.person_pin_outlined,
                    text: TextConstant.users,
                    onTap: () async {
                      await routeController.routeUpdate('/user');
                      await routeController.routeGet();
                      Navigator.of(context).pushReplacementNamed(
                          routeController.route.toString());
                    },
                  ),
                ))));
  }
}
