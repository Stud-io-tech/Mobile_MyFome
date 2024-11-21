// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_fome/src/core/constants/text_constant.dart';

import 'package:my_fome/uikit/lib/uikit.dart';

class SeeMoreStoreLink extends StatelessWidget {
  final void Function() onTap;
  const SeeMoreStoreLink({
    super.key,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return SeeMoreLink(
      text: TextConstant.seeMoreStores,
      onTap: onTap,
    );
  }
}
