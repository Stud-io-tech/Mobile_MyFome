// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uikit/uikit.dart';

class InputDefault extends StatelessWidget {
  final Icon? icon;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType? keyBoardType;
  final String hintText;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  const InputDefault({
    super.key,
    this.icon,
    this.prefix,
    this.suffix,
    this.keyBoardType,
    required this.hintText,
    this.maxLines = 1,
    this.inputFormatters,
    this.validator,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    
      keyboardType: keyBoardType,
      maxLines: maxLines,
      style: Style.label(),
      controller: controller ?? controller,
      validator: validator ?? validator,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        prefix: prefix,
        contentPadding: const EdgeInsets.symmetric(
            horizontal: Scale.sm, vertical: Scale.sm),
        isDense: true,
        suffixIconConstraints: const BoxConstraints(),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: Scale.sm, left: Scale.xs),
          child: icon ?? icon,
        ),
        suffix: suffix,
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
        hintText: hintText,
      ),
      onChanged: onChanged,
    );
  }
}
