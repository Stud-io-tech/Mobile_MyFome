import 'package:my_fome/src/modules/home/presentation/widgets/card/initial_happy_card.dart';
import 'package:my_fome/src/modules/home/presentation/widgets/listView/product_by_category_list_view.dart';
import 'package:my_fome/src/modules/home/presentation/widgets/listView/store_list_view.dart';
import 'package:my_fome/uikit/lib/uikit.dart';
import 'package:flutter/material.dart';

class HomeUser extends StatelessWidget {

  const HomeUser({ super.key });

   @override
   Widget build(BuildContext context) {
       return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InitialHappyCard(),
        SizedBox(
          height: Scale.md,
        ),
        StoreListView(),
        SizedBox(
          height: Scale.md,
        ),
        ProductByCategoryListView()
      ],
    );
  }
}