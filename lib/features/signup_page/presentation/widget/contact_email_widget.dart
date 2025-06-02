import 'package:flutter/material.dart';
import '../../../../core/components/custom_text_form_field.dart';

class ContactEmailWidget extends StatelessWidget {
  const ContactEmailWidget({
    super.key,
    required this.emailController,
    this.validator,
    this.autovalidateMode,
    this.onChanged,
  });
  final Function(String)? onChanged;

  final AutovalidateMode? autovalidateMode;
  final TextEditingController emailController;
  final String? Function(String? value)? validator;
  @override
  Widget build(BuildContext context) {
    final kTextTheme = Theme.of(context).textTheme;
    final h = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //! title email
        Text(
          'Email',
          style: kTextTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: h * 0.004),
        //! textFormField Email
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
