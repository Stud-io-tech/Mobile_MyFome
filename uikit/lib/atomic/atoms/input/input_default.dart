// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uikit/uikit.dart';

class InputDefault extends StatelessWidget {
  final String? icon;
  final void Function()? onTap;
  final TextInputType? keyBoardType;
  final String hintText;
  final int maxLines;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final double? paddingLeftPrefix;
  const InputDefault({
    super.key,
    this.icon,
    this.onTap,
    this.keyBoardType,
    required this.hintText,
    this.maxLines = 1,
    this.textInputAction,
    this.inputFormatters,
    this.validator,
    this.controller,
    this.onChanged,
    this.paddingLeftPrefix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: onTap != null ? true : false,
      keyboardType: keyBoardType,
      maxLines: maxLines,
      style: Style.b1(color: ColorToken.dark),
      textInputAction: textInputAction,
      controller: controller ?? controller,
      validator: validator ?? validator,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
          filled: true,
          fillColor: ColorToken.neutral,
          contentPadding: const EdgeInsets.all(SizeToken.sm),
          isDense: true,
          prefixIconConstraints: const BoxConstraints(),
          prefixIcon: Padding(
            padding: EdgeInsets.only(right: paddingLeftPrefix != null? paddingLeftPrefix!: 0, left: SizeToken.xxs),
            child: icon != null
                ? IconLargeSemiDark(
                    icon: icon!,
                    padding: SizeToken.xs,
                  )
                : const SizedBox.shrink(),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(SizeToken.xs),
            ),
            borderSide: BorderSide.none,
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(SizeToken.xs),
            ),
            borderSide: BorderSide.none,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(SizeToken.xs),
            ),
            borderSide: BorderSide.none,
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(SizeToken.xs),
            ),
            borderSide: BorderSide.none,
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(SizeToken.xs),
            ),
            borderSide: BorderSide(color: ColorToken.danger, width: 1),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(SizeToken.xs),
            ),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          hintStyle: Style.b1(color: ColorToken.semiDark)),
      onChanged: onChanged,
    );
  }
}
