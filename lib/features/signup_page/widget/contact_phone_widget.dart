import 'package:flutter/material.dart';
import 'package:invesier/components/custom_text_field.dart';
import 'package:invesier/constant/color_manger.dart';

class ContactPhoneWidget extends StatelessWidget {
  const ContactPhoneWidget({super.key, required this.phoneController});

  final TextEditingController phoneController;

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
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: ColorManger.kBorder),
              ),
              child: Center(
                //! TextCountry
                child: Text(
                  '🇪🇬 +20',
                  style: kTextTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),
            //! TextFormField Phone
            CustomTextFormField(
              title: '0109******',
              controller: phoneController,
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ],
    );
  }
}
