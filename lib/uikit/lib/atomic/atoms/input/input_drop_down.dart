// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:uikit/uikit.dart';
import 'package:flutter/material.dart';

class InputDropDown extends StatelessWidget {
  final Icon? icon;
  final String hintText;
  final String? selectedValue;
  final List<DropdownMenuItem<String>> items;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  const InputDropDown({
    super.key,
    this.icon,
    required this.hintText,
    this.selectedValue,
    required this.items,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isDense: true,
      value: selectedValue,
      validator: validator,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: Scale.sm,
          vertical: Scale.sm,
        ),
        isDense: true,
        suffixIconConstraints: const BoxConstraints(),
        suffixIcon: null,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Scale.xs),
          ),
          borderSide: BorderSide(color: LightColors.onPrimary, width: 2),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Scale.xs),
          ),
          borderSide: BorderSide(color: LightColors.error, width: 2),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Scale.xs),
          ),
          borderSide: BorderSide(color: LightColors.tertiary, width: 2),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Scale.xs),
          ),
          borderSide: BorderSide(color: LightColors.tertiary, width: 2),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Scale.xs),
          ),
          borderSide: BorderSide(color: LightColors.error, width: 2),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Scale.xs),
          ),
          borderSide: BorderSide(color: LightColors.tertiary, width: 2),
        ),
      ),
      hint: LabelText(text: hintText),
      onChanged: onChanged,
      items: items,
    );
  }
}
