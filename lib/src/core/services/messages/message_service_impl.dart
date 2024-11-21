// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_fome/uikit/lib/uikit.dart';
import './message_service.dart';

class MessageServiceImpl implements MessageService {
  final GlobalKey<NavigatorState> navigatorKey;
  MessageServiceImpl({
    required this.navigatorKey,
  });

  TextButton content(String message, Icon icon) {
    return TextButton.icon(
        onPressed: () {},
        style: TextButton.styleFrom(
          alignment: Alignment.centerLeft,
          iconColor: LightColors.background,
          foregroundColor: LightColors.background,
        ),
        label: Column(
          children: [
            const SizedBox(
              height: Scale.xxs,
            ),
            TitleText(text: message),
          ],
        ),
        icon: icon);
  }

  @override
  showMessageError(String message) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 10),
          content: content(
            message,
            const Icon(
              Icons.error_outline_rounded,
            ),
          ),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(Scale.md),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Scale.sm),
          ),
        ),
      );
    }
  }

  @override
  showMessageSuccess(String message) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: LightColors.success,
          duration: const Duration(seconds: 10),
          content: content(
            message,
            const Icon(
              Icons.check_circle_outlined,
            ),
          ),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(Scale.md),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Scale.sm),
          ),
        ),
      );
    }
  }
}
