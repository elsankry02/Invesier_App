import 'package:flutter/material.dart';
import '../../../../core/components/custom_text_form_field.dart';

class ContactPhoneWidget extends StatelessWidget {
  const ContactPhoneWidget({
    super.key,
    required this.phoneController,
    this.validator,
    this.autovalidateMode,
    this.onChanged,
  });
  final Function(String value)? onChanged;
  final AutovalidateMode? autovalidateMode;
  final TextEditingController phoneController;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    final kTextTheme = Theme.of(context).textTheme;
    final h = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //! Phone number
        Text(
          'Phone number',
          style: kTextTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: h * 0.004),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //? لس هعملها
            SizedBox(width: 5),
            //! TextFormField Phone
            Expanded(
              child: CustomTextFormField(
                onChanged: onChanged,
                autovalidateMode: autovalidateMode,
                title: '0109******',
                controller: phoneController,
                validator: validator,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
