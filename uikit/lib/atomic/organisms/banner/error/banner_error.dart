// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uikit/uikit.dart';

class BannerError extends StatelessWidget {
  final String image;
  final String text;
  const BannerError({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 330,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              width: 300,
              height: 300,
            ),
            TextLabelL2Dark(
              text: text,
            ),
          ],
        ),
      ),
    );
  }
}
