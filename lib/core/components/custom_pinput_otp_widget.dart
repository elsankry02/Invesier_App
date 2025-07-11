import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../constant/color_manger.dart';
import '../extension/extension.dart';

class CustomPinPutOTPWidget extends StatefulWidget {
  const CustomPinPutOTPWidget({
    super.key,
    this.validator,
    this.onChanged,
    this.pinController,
  });

  final String? Function(String? value)? validator;
  final Function(String value)? onChanged;
  final TextEditingController? pinController;

  @override
  State<CustomPinPutOTPWidget> createState() => _CustomPinPutOTPWidgetState();
}

class _CustomPinPutOTPWidgetState extends State<CustomPinPutOTPWidget> {
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
            autofocus: true,
            length: 6,
            controller: widget.pinController,
            // errorPinTheme
            errorPinTheme: pinTheme(
              textColor: ColorManger.kRedTwo,
              borderColor: ColorManger.kRedTwo,
              backGroundColor: ColorManger.kWhite,
            ),

            // defaultPinTheme
            defaultPinTheme: pinTheme(
              textColor: ColorManger.kWhite,
              borderColor: ColorManger.kBorder,
              backGroundColor: ColorManger.kBackGround,
            ),
            // onChanged
            onChanged: widget.onChanged,
            // validator
            validator: widget.validator,
          ),
        ),
      ],
    );
  }

  PinTheme pinTheme({required Color textColor, backGroundColor, borderColor}) {
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
