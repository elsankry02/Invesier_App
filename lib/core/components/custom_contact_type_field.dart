import 'package:flutter/material.dart';

import '../extension/extension.dart';
import 'custom_text_form_field.dart';

class CustomContactTypeFieldWidget extends StatelessWidget {
  final Function(String value)? onChanged;
  final AutovalidateMode? autovalidateMode;
  final TextEditingController tybeController;
  final String? Function(String? value)? validator;
  final String title, hintText;
  const CustomContactTypeFieldWidget({
    super.key,
    required this.tybeController,
    this.validator,
    this.autovalidateMode,
    this.onChanged,
    required this.title,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Phone number
        Text(
          title,
          style: context.kTextTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: context.height * 0.004),
        CustomTextFormField(
          onChanged: onChanged,
          autovalidateMode: autovalidateMode,
          hintText: hintText,
          controller: tybeController,
          validator: validator,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
