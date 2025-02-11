/* import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_fome/src/constants/icon_constant.dart';
import 'package:my_fome/src/constants/image_error_constant.dart';
import 'package:my_fome/src/constants/text_constant.dart';
import 'package:my_fome/src/ui/modules/home/controllers/auth/auth_google_controller.dart';
import 'package:my_fome/src/ui/modules/store/controllers/store/store_controller.dart';
import 'package:my_fome/src/ui/modules/store/widgets/my_store_widget.dart';
import 'package:my_fome/src/ui/modules/store/widgets/register_store.dart';
import 'package:uikit/uikit.dart';

class MyStorePage extends StatelessWidget {
  MyStorePage({super.key});

  final storeController = Injector.get<StoreController>();
  final authController = Injector.get<AuthGoogleController>();
  @override
  Widget build(BuildContext context) {
    authController.load();
    return Observer(
      builder: (_) {
        /* if (authController.isLoading) {
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
                              onTap: () => Navigator.of(context)
                                  .pushReplacementNamed('/'),
                              icon: IconConstant.arrowLeft),
                          const SizedBox(
                            width: SizeToken.sm,
                          ),
                          TextHeadlineH2(text: TextConstant.stores)
                        ],
                      ),
                    ],
                  ),
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                ],
              ),
            ),
          );
        } */
        if (authController.user == null) {
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
                              onTap: () => Navigator.of(context)
                                  .pushReplacementNamed('/'),
                              icon: IconConstant.arrowLeft),
                          const SizedBox(
                            width: SizeToken.sm,
                          ),
                          TextHeadlineH2(text: TextConstant.stores)
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
            bottomNavigationBar: ButtonLarge(
              isLoading: authController.isLoading,
              text: TextConstant.loggin,
              icon: IconConstant.user,
              onPressed: () => authController.login(),
            ),
          );
        }
        if (authController.store != null) {
          return MyStoreWidget(store: authController.store!);
        }
        return RegisterStore();
      },
    );
  }
}
 */