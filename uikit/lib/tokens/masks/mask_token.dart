import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final class MaskToken {
  static final List<TextInputFormatter> phoneInput = [
    FilteringTextInputFormatter.digitsOnly,
    MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {'#': RegExp(r'[0-9]')},
    ),
  ];

  static final maskFormatter = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  static String formatPhoneNumber(String phoneNumber) {
    return maskFormatter.maskText(phoneNumber);
  }

  static final RegExp phoneOutput = RegExp(r'^(\d{2})(\d{5})(\d{4})$');
  static String photoOutputMacth(Match m) => '(${m[1]}) ${m[2]}-${m[3]}';

  static final RegExp removeMask = RegExp(r'\D');
}