// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class ModalSheet extends StatelessWidget {
  final String iconBack;
  final String title;
  final String description;
  final String cancelText;
  final String continueText;
  final bool isLoading;
  final void Function() continueOnTap;
  const ModalSheet({
    super.key,
    required this.iconBack,
    required this.title,
    required this.description,
    required this.cancelText,
    required this.continueText,
    this.isLoading = false,
    required this.continueOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Wrap(
          children: [
            Row(
              children: [
                IconButtonLargeDark(
                    onTap: () => Navigator.of(context).pop(), icon: iconBack),
                const SizedBox(
                  width: SizeToken.sm,
                ),
                TextLabelL1Dark(text: title)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: SizeToken.sm, bottom: SizeToken.md),
                  child: TextBodyB1SemiDark(
                    text: description,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: ButtonCancel(
                  text: cancelText,
                  onPressed: () => Navigator.of(context).pop(),
                )),
                const SizedBox(
                  width: SizeToken.sm,
                ),
                Expanded(
                  child: ButtonProgress(
                    key: const Key("confirm"),
                    isLoading: isLoading,
                    text: continueText,
                    onPressed: continueOnTap,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
