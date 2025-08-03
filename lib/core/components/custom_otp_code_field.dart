import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../constant/app_colors.dart';
import '../extension/extension.dart';

class CustomOtpCodeField extends StatelessWidget {
  final String? Function(String? value)? validator;
  final void Function(String value)? onChanged;
  final TextEditingController? pinPutController;
  const CustomOtpCodeField({
    super.key,
    this.validator,
    this.pinPutController,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // OTP Code
        Text(
          'OTP Code',
          style: context.kTextTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: context.height * 0.015),
        Center(
          child: Pinput(
            length: 6,
            autofocus: true,
            controller: pinPutController,
            // errorPinTheme
            errorPinTheme: pinTheme(
              context: context,
              textColor: AppColors.kRedTwo,
              borderColor: AppColors.kRedTwo,
              backGroundColor: AppColors.kWhite,
            ),
            // defaultPinTheme
            defaultPinTheme: pinTheme(
              context: context,
              textColor: AppColors.kWhite,
              borderColor: AppColors.kBorder,
              backGroundColor: AppColors.kBackGround,
            ),
            onChanged: onChanged,
            // validator
            validator: validator,
          ),
        ),
      ],
    );
  }

  PinTheme pinTheme({
    required Color textColor,
    backGroundColor,
    borderColor,
    required BuildContext context,
  }) {
    return PinTheme(
      margin: EdgeInsets.only(right: 5, left: 5),
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        // textColor
        color: textColor,
      ),
      height: context.height * 0.054,
      width: context.height * 0.050,
      decoration: BoxDecoration(
        // backGroundColor
        color: backGroundColor,
        // borderColor
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
