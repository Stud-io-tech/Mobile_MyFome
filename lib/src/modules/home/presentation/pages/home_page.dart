import 'package:flutter/material.dart';
import 'package:my_fome/src/core/controllers/user/user_controller.dart';
import 'package:my_fome/src/modules/home/presentation/widgets/appBarAction/app_bar_action_widget.dart';
import 'package:my_fome/src/modules/home/presentation/widgets/drawer/drawer_widget.dart';
import 'package:my_fome/src/modules/home/presentation/widgets/role/admin/home_admin.dart';
import 'package:my_fome/src/modules/home/presentation/widgets/role/user/home_user.dart';
import 'package:my_fome/uikit/lib/uikit.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userController = Injector.get<UserController>();

  @override
  void initState() {
    super.initState();
    userController.detail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/ENTREGAS-LOGO-HORIZONTAL.png',
          fit: BoxFit.cover,
          height: Scale.lg,
        ),
        actions: const [
          AppBarActionWidget(),
        ],
      ),
      body: BodyDefault(
        body: Observer(builder: (_) {
          if (userController.user == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (userController.user!.role == 'ADMIN') {
              return const HomeAdmin();
            }
            return const HomeUser();
          }
        }),
      ),
      drawer: DrawerWidget(),
    );
  }
}
