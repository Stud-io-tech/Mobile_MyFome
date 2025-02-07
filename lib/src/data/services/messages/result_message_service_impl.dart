// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_fome/src/constants/icon_constant.dart';
import 'package:my_fome/src/constants/text_constant.dart';
import 'package:uikit/uikit.dart';

import 'result_message_service.dart';

class ResultMessageServiceImpl implements ResultMessageService {
  final GlobalKey<NavigatorState> navigatorKey;
  ResultMessageServiceImpl({
    required this.navigatorKey,
  });

  @override
  showMessageError(String message) {
    if (navigatorKey.currentContext != null) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBarListview(
          title: TextConstant.errorTitle,
          subtitle: message,
          iconLeading: IconConstant.error,
          iconTrailing: IconConstant.close,
          context: navigatorKey.currentContext!,
        ),
      );
    }
  }

  @override
  showMessageSuccess(String title, String message, String iconLeading) {
    if (navigatorKey.currentContext != null) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBarListview(
          title: title,
          subtitle: message,
          iconLeading: iconLeading,
          iconTrailing: IconConstant.close,
          context: navigatorKey.currentContext!,
        ),
      );
    }
  }
}
