import 'package:flutter/material.dart';
import 'package:my_fome/src/core/constants/text_constant.dart';
import 'package:my_fome/uikit/lib/uikit.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_fome/src/core/controllers/auth/auth_controller.dart';
import 'package:my_fome/src/core/controllers/route/route_controller.dart';
import 'package:my_fome/src/core/controllers/user/user_controller.dart';

class InitialHappyCard extends StatefulWidget {
  const InitialHappyCard({super.key});

  @override
  State<InitialHappyCard> createState() => _InitialHappyCardState();
}

class _InitialHappyCardState extends State<InitialHappyCard> {
  final userController = Injector.get<UserController>();
  final authController = Injector.get<AuthController>();
  final routeController = Injector.get<RouteController>();
  @override
  void initState() {
    super.initState();
    userController.detail();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CardDefault(
            child: Padding(
              padding: const EdgeInsets.all(Scale.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Observer(
                    builder: (_) {
                      if (userController.user?.name == null) {
                        return const CircularProgressIndicator();
                      }
                      return HeadlineText(
                        text:
                            "${TextConstant.hello}, ${userController.user?.name}!",
                      );
                    },
                  ),
                  const DividerDefault(),
                  const SizedBox(
                    height: Scale.xxs,
                  ),
                  LabelText(
                    text: TextConstant.happyMessage,
                  ),
                  LabelText(
                    text: TextConstant.happyQuestion,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: Scale.xs,
          ),
          CardDefault(
            borderRadius: Scale.xl,
            child: Padding(
              padding: const EdgeInsets.all(
                Scale.xs,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 30,
                            child: SmallButton(
                              text: TextConstant.myLocations,
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed(
                                    '/search/institute/by/user');
                              },
                            ),
                          ),
                          const SizedBox(
                            width: Scale.xs,
                          ),
                          SizedBox(
                            height: 30,
                            child: SmallButton(
                              text: TextConstant.products,
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed('/search/product');
                              },
                            ),
                          ),
                          const SizedBox(
                            width: Scale.xs,
                          ),
                          const SizedBox(
                            width: Scale.xs,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: Scale.xxs, bottom: Scale.xxs),
                    child: Image.asset(
                      "assets/images/favicon.png",
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
