import 'package:flutter/services.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Remove todos os caracteres não numéricos
    String cleanedText = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (cleanedText.isEmpty) {
      return const TextEditingValue(
        text: '0.00',
        selection: TextSelection.collapsed(offset: 4),
      );
    }

    // Se o texto limpo tiver 2 dígitos ou menos, trata como centavos
    String integerPart;
    String decimalPart;

    if (cleanedText.length > 2) {
      // Divide o texto limpo em parte inteira e parte decimal
      integerPart = cleanedText.substring(0, cleanedText.length - 2);
      decimalPart = cleanedText.substring(cleanedText.length - 2);
    } else {
      // Se o texto limpo tiver 2 dígitos ou menos, considera a parte inteira como '0'
      integerPart = '0';
      decimalPart = cleanedText.padLeft(2, '0');
    }

    // Remove zeros à esquerda da parte inteira
    integerPart = integerPart.replaceFirst(RegExp(r'^0+'), '');

    // Se a parte inteira estiver vazia após remoção de zeros, define como '0'
    if (integerPart.isEmpty) {
      integerPart = '0';
    }

    // Formata o valor monetário com ponto decimal
    String formattedValue = '$integerPart.$decimalPart';

    // Ajusta a posição do cursor
    final cursorOffset = formattedValue.length;
    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: cursorOffset),
    );
  }
}
