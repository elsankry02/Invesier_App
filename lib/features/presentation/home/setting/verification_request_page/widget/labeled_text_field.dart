import 'package:flutter/material.dart';
import 'package:invesier/core/components/custom_text_form_field.dart';
import 'package:invesier/core/extension/extension.dart';

class LabeledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String joptile, hintText;
  const LabeledTextField({
    super.key,
    required this.controller,
    required this.joptile,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          joptile,
          style: context.kTextTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: context.height * 0.004),
        CustomTextFormField(hintText: hintText, controller: controller),
      ],
    );
  }
}
