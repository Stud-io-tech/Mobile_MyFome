// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:uikit/uikit.dart';
import 'package:flutter/material.dart';


class BodyDefault extends StatelessWidget {
  final Widget body;
  const BodyDefault({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ContentDefault(
        child: Column(
          children: [
            body,
            const SizedBox(
               height: Scale.xs,
            ),
            const DividerDefault(),
          ],
        ),
      ),
    );
  }
}
