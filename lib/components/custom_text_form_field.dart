import 'package:flutter/material.dart';
import 'package:invesier/constant/color_manger.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.title,
    this.keyboardType,
    required this.controller,
    this.validator,
  });
  final String title;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  @override
  Widget build(BuildContext context) {
    final kTextTheme = Theme.of(context).textTheme;
    return TextFormField(
      validator: validator,
      controller: controller,
      cursorColor: ColorManger.kWhite,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: kTextTheme.titleSmall,
        enabledBorder: outlineInputBorder(borderColor: ColorManger.kBorder),
        focusedBorder: outlineInputBorder(borderColor: ColorManger.kBorder),
        errorBorder: outlineInputBorder(borderColor: ColorManger.kPersianRed),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder({required Color borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: borderColor),
    );
  }
}
