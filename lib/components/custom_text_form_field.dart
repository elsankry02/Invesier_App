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
    return Expanded(
      child: TextFormField(
        validator: validator,
        controller: controller,
        cursorColor: ColorManger.kWhite,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: title,
          hintStyle: kTextTheme.titleSmall,
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: ColorManger.kBorder),
    );
  }
}
