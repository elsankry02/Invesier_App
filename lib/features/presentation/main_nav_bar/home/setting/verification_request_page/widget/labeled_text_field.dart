import 'package:flutter/material.dart';
import 'package:invesier/core/constant/app_text_theme.dart';

import '../../../../../../../core/components/custom_text_form_field.dart';
import '../../../../../../../core/extension/extension.dart';

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
          style: AppTextTheme.kTitleMedium(
            context,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: context.height * 0.004),
        CustomTextFormField(hintText: hintText, controller: controller),
      ],
    );
  }
}
