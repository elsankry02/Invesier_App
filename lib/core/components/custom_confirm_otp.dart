import 'package:flutter/material.dart';
import '../extension/extension.dart';
import 'package:pinput/pinput.dart';

import '../constant/color_manger.dart';

class CustomConfirmOTP extends StatefulWidget {
  const CustomConfirmOTP({super.key, this.validator, this.onChanged});

  final String? Function(String? value)? validator;
  final Function(String value)? onChanged;

  @override
  State<CustomConfirmOTP> createState() => _CustomConfirmOTPState();
}

class _CustomConfirmOTPState extends State<CustomConfirmOTP> {
  final pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'OTP Code',
          style: context.kTextTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: context.h * 0.015),
        Center(
          child: Pinput(
            length: 6,
            controller: pinController,
            errorPinTheme: pinTheme(
              textColor: ColorManger.kPersianRed,
              borderColor: ColorManger.kPersianRed,
              backGroundColor: ColorManger.kWhite,
            ),
            defaultPinTheme: pinTheme(
              textColor: ColorManger.kWhite,
              borderColor: ColorManger.kBorder,
              backGroundColor: ColorManger.kBackGround,
            ),
            onChanged: widget.onChanged,
            validator: widget.validator,
          ),
        ),
      ],
    );
  }

  PinTheme pinTheme({
    required Color borderColor,
    required Color backGroundColor,
    required Color textColor,
  }) {
    return PinTheme(
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      margin: EdgeInsets.only(right: 10),
      height: 54,
      width: 50,
      decoration: BoxDecoration(
        color: backGroundColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
