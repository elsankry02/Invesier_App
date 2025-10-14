import 'package:flutter/material.dart';

import '../constant/app_text_theme.dart';
import '../extension/extension.dart';
import 'custom_text_form_field.dart';

class CustomContactTypeFieldWidget extends StatelessWidget {
  final Function(String value)? onChanged;
  final AutovalidateMode? autovalidateMode;
  final TextEditingController tybeController;
  final TextInputType? keyboardType;
  final int? maxLength;
  final String? Function(String? value)? validator;
  final String title, hintText;
  const CustomContactTypeFieldWidget({
    super.key,
    required this.tybeController,
    this.validator,
    this.autovalidateMode,
    this.onChanged,
    this.keyboardType,
    required this.title,
    required this.hintText,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Phone number
        Text(
          title,
          style: AppTextTheme.kLabelLarge(context, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: context.height * 0.004),
        CustomTextFormField(
          maxLength: maxLength,
          onChanged: onChanged,
          autovalidateMode: autovalidateMode,
          hintText: hintText,
          controller: tybeController,
          validator: validator,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
