import 'package:flutter/material.dart';

import '../../../../core/components/custom_text_form_field.dart';
import '../../../../core/extension/extension.dart';

class ContactEmailWidget extends StatelessWidget {
  final AutovalidateMode? autovalidateMode;
  final TextEditingController emailController;
  final String? Function(String? value)? validator;
  const ContactEmailWidget({
    super.key,
    required this.emailController,
    this.validator,
    this.autovalidateMode,
    this.onChanged,
  });
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title email
        Text(
          'Email',
          style: context.kTextTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: context.height * 0.004),
        // textFormField Email
        CustomTextFormField(
          autovalidateMode: autovalidateMode,
          title: 'name@gmail.com',
          controller: emailController,
          validator: validator,
        ),
      ],
    );
  }
}
