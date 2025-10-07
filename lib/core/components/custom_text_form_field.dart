import 'package:flutter/material.dart';

import '../constant/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;
  final TextStyle? hintStyle;
  final int? maxLength;
  final TextEditingController controller;
  final Function(String value)? onChanged, onFieldSubmitted;
  final String? Function(String? value)? validator;
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.autovalidateMode,
    this.hintStyle,
    this.onFieldSubmitted,
    this.maxLength,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      autofocus: true,
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      maxLength: maxLength,
      onFieldSubmitted: onFieldSubmitted,
      cursorColor: AppColors.kWhite,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        enabledBorder: outlineInputBorder(borderColor: AppColors.kBorder),
        focusedBorder: outlineInputBorder(borderColor: AppColors.kBorder),
        focusedErrorBorder: outlineInputBorder(borderColor: AppColors.kRedTwo),
        errorBorder: outlineInputBorder(borderColor: AppColors.kRedTwo),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder({required Color borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      // borderColor
      borderSide: BorderSide(color: borderColor),
    );
  }
}
