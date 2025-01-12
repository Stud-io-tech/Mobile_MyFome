// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class StoreItem extends StatelessWidget {
  final String name;
  final String description;
  final String image;
  final String icon;
  final void Function() onTap;
  const StoreItem({
    super.key,
    required this.name,
    required this.description,
    required this.image,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(
        SizeToken.xxs,
      ),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: ColorToken.semiDark, width: 0.2),
            borderRadius: BorderRadius.circular(
              SizeToken.xxs,
            ),),
            padding: const EdgeInsets.symmetric(horizontal: SizeToken.sm),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: TextLabelL2Dark(
            text: name,
            overflow: true,
          ),
          subtitle: TextBodyB2SemiDark(
            text: description,
            overflow: true,
          ),
          trailing: IconMediumDark(
            icon: icon,
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(
              SizeToken.xl,
            ),
            child: SizedBox(
              height: 45,
              width: 45,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
