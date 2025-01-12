// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class ImageDetail extends StatelessWidget {
  final String image;
  final String iconLeft;
  final String? iconRigth;
  final void Function() onTapIconLeft;
  final void Function()? onTapIconRight;
  const ImageDetail({
    super.key,
    required this.image,
    required this.iconLeft,
    this.iconRigth,
    required this.onTapIconLeft,
    this.onTapIconRight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.width,
        minWidth: double.infinity
      ),
      child: Stack(
        children: [
          Image.network(
            image, 
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.width,
          ),
          Positioned(
            top: SizeToken.xl3,
            right: SizeToken.md,
            left: SizeToken.md,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButtonLargeDark(
                  onTap: onTapIconLeft,
                  icon: iconLeft,
                ),
                iconRigth != null
                    ? IconButtonLargeDark(
                        onTap: onTapIconRight!,
                        icon: iconRigth!,
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
