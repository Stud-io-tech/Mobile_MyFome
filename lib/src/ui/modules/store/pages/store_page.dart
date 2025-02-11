import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_fome/src/constants/icon_constant.dart';
import 'package:my_fome/src/constants/image_error_constant.dart';
import 'package:my_fome/src/constants/text_constant.dart';
import 'package:my_fome/src/ui/modules/home/widgets/screens/store_detail_screen_widget.dart';
import 'package:my_fome/src/ui/modules/store/controllers/store/store_controller.dart';
import 'package:uikit/uikit.dart';

class StorePage extends StatelessWidget {
  StorePage({super.key});

  final storeController = Injector.get<StoreController>();

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
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed('/store/my'),
                )
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
              const SizedBox(
                height: SizeToken.xxs,
              ),
              Observer(builder: (_) {
                return Container(
                  padding: const EdgeInsets.only(right: SizeToken.xs),
                  alignment: Alignment.centerRight,
                  child: TextBodyB2SemiDark(
                    text: TextConstant.found(storeController.founds),
                  ),
                );
              }),
              const SizedBox(
                height: SizeToken.md,
              ),
              Observer(builder: (_) {
                if (storeController.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (storeController.stores!.isEmpty) {
                  return BannerError(
                      image: ImageErrorConstant.empty,
                      text: TextConstant.storeNotFound);
                }
                return ListView.builder(
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
