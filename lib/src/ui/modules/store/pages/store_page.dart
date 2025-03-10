import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_fome/src/constants/icon_constant.dart';
import 'package:my_fome/src/constants/image_error_constant.dart';
import 'package:my_fome/src/constants/text_constant.dart';
import 'package:my_fome/src/ui/controllers/auth/auth_google_controller.dart';
import 'package:my_fome/src/ui/controllers/store/store_controller.dart';
import 'package:my_fome/src/ui/modules/home/widgets/screens/store_detail_screen_widget.dart';
import 'package:uikit/uikit.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final storeController = Injector.get<StoreController>();
  final authController = Injector.get<AuthGoogleController>();
  @override
  void initState() {
    super.initState();
    storeController.listStore();
  }

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
                    TextHeadlineH2(text: TextConstant.stores)
                  ],
                ),
                LinkSeeMore(
                  text: TextConstant.myStore,
                  onTap: () {
                    if (authController.user == null) {
                      Navigator.of(context).pushReplacementNamed('/login');
                      return;
                    }
                    if (authController.store != null) {
                      Navigator.of(context).pushReplacementNamed('/store/my');
                    } else {
                      Navigator.of(context)
                          .pushReplacementNamed('/store/register');
                    }
                  },
                ),
              ],
            ),
            SingleChildScrollView(
                child: Column(children: [
              const SizedBox(
                height: SizeToken.lg,
              ),
              InputSearch(
                  onChanged: storeController.filterStores,
                  hintText: TextConstant.search,
                  icon: IconConstant.search),
          
              Observer(builder: (_) {
                return Container(
                  padding: const EdgeInsets.only(right: SizeToken.xs),
                  alignment: Alignment.centerRight,
                  child: TextBodyB2SemiDark(
                    text: TextConstant.found(storeController.founds),
                  ),
                );
              }),
              Observer(builder: (_) {
                if (storeController.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (storeController.isServerError) {
                  return BannerError(
                    image: ImageErrorConstant.serverError,
                    text: TextConstant.serverError,
                  );
                }
                if (storeController.stores!.isEmpty) {
                  return BannerError(
                      image: ImageErrorConstant.empty,
                      text: TextConstant.storeNotFound);
                }
                return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                     height: SizeToken.xs,
                  ), 
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: storeController.stores?.length ?? 0,
                  itemBuilder: (context, index) {
                    final store = storeController.stores![index];
                    return StoreItem(
                      name: store.name,
                      description: store.description,
                      image: store.image,
                      icon: IconConstant.chevronRigth,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => StoreDetailScreenWidget(
                            store: store,
                          ),
                        ),
                      ),
                    );
                  },
                );
              })
            ]))
          ],
        ),
      ),
    );
  }
}
