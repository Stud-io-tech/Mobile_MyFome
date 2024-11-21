import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:uikit/tokens/masks/currency_input_formatter.dart';

final class Mask {
  static final List<TextInputFormatter> phoneInput = [
    FilteringTextInputFormatter.digitsOnly,
    MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {'#': RegExp(r'[0-9]')},
    ),
  ];

  static final List<TextInputFormatter> currencyInput = [
    FilteringTextInputFormatter.digitsOnly,
    CurrencyInputFormatter(),
  ];

  static final RegExp currencyOutput = RegExp(r'^(\d+)(\d{2})$');
  static String currencyOutputMatch(Match m) => '${m[1]}.${m[2]}';

  static final RegExp phoneOutput = RegExp(r'^(\d{2})(\d{5})(\d{4})$');
  static String photoOutputMacth(Match m) => '(${m[1]}) ${m[2]}-${m[3]}';

  static final RegExp removeMask = RegExp(r'\D');

  static String removeAllMask(String maskedString) {
  return maskedString.replaceAll(RegExp(r'[^\d]'), '');
}

  static String formatPhoneNumber(String phoneNumber) {
    final match = Mask.phoneOutput
        .firstMatch(phoneNumber.replaceAll(Mask.removeMask, ''));
    if (match != null) {
      return Mask.photoOutputMacth(match);
    }
    return phoneNumber;
  }

  static String formatCurrency(String value) {
    final match = Mask.currencyOutput
        .firstMatch(value.replaceAll(Mask.removeMask, ''));
    if (match != null) {
      return Mask.currencyOutputMatch(match);
    }
    return value;
  }
}
