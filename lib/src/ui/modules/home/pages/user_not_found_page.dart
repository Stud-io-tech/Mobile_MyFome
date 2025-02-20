import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_fome/src/constants/icon_constant.dart';
import 'package:my_fome/src/constants/image_error_constant.dart';
import 'package:my_fome/src/constants/text_constant.dart';
import 'package:my_fome/src/ui/modules/controllers/auth/auth_google_controller.dart';
import 'package:uikit/uikit.dart';

class UserNotFoundPage extends StatelessWidget {
  UserNotFoundPage({super.key});
  final authController = Injector.get<AuthGoogleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentDefault(
        child: Column(
          children: [
            const SizedBox(
              height: SizeToken.xl3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButtonLargeDark(
                        onTap: () =>
                            Navigator.of(context).pushReplacementNamed('/'),
                        icon: IconConstant.arrowLeft),
                    const SizedBox(
                      width: SizeToken.sm,
                    ),
                    TextHeadlineH2(text: TextConstant.loggin)
                  ],
                ),
              ],
            ),
            const Spacer(),
            BannerError(
              image: ImageErrorConstant.login,
              text: TextConstant.requiredLogin,
            ),
            const Spacer(),
            const Spacer()
          ],
        ),
      ),
      bottomNavigationBar: Observer(builder: (_) {
        return ButtonLarge(
          isLoading: authController.isLoading,
          text: TextConstant.loggin,
          icon: IconConstant.user,
          onPressed: () async {
            await authController.login();
            await authController.load();
            if (authController.user != null) {
              if (authController.store != null) {
                Navigator.of(context).pushReplacementNamed('/store/my');
              } else {
                Navigator.of(context).pushReplacementNamed('/store/register');
              }
            }
          },
        );
      }),
    );
  }
}
