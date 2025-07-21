import 'package:flutter/material.dart';

import '../constant/color_manger.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  const CustomTextFormField({
    super.key,
    required this.title,
    required this.controller,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.autovalidateMode,
  });
  @override
  Widget build(BuildContext context) {
    final kTextTheme = Theme.of(context).textTheme;
    return TextFormField(
      // autovalidateMode
      autovalidateMode: autovalidateMode,
      // validator
      validator: validator,
      // controller
      controller: controller,
      // onChanged
      onChanged: onChanged,
      cursorColor: ColorManger.kWhite,
      // keyboardType
      keyboardType: keyboardType,
      decoration: InputDecoration(
        //title
        hintText: title,
        hintStyle: kTextTheme.titleSmall,
        enabledBorder: outlineInputBorder(borderColor: ColorManger.kBorder),
        focusedBorder: outlineInputBorder(borderColor: ColorManger.kBorder),
        focusedErrorBorder: outlineInputBorder(
          borderColor: ColorManger.kRedTwo,
        ),
        errorBorder: outlineInputBorder(borderColor: ColorManger.kRedTwo),
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
