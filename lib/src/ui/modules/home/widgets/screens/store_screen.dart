import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_fome/src/constants/icon_constant.dart';
import 'package:my_fome/src/constants/image_error_constant.dart';
import 'package:my_fome/src/constants/text_constant.dart';
import 'package:my_fome/src/ui/modules/home/controllers/store/store_controller.dart';
import 'package:my_fome/src/ui/modules/home/widgets/screens/store_detail_screen_widget.dart';
import 'package:uikit/uikit.dart';

class StoreScreen extends StatelessWidget {
  StoreScreen({super.key});
  final storeController = Injector.get<StoreController>();

  @override
  Widget build(BuildContext context) {
    storeController.listStore();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: SizeToken.md,
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
          }),
        ],
      ),
    );
  }
}
