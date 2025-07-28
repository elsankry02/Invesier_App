import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../constant/app_colors.dart';
import '../extension/extension.dart';

class CustomPinPutWidget extends StatefulWidget {
  final String? Function(String? value)? validator;
  final Function(String value)? onChanged;
  final TextEditingController? pinPutController;
  const CustomPinPutWidget({
    super.key,
    this.validator,
    this.onChanged,
    this.pinPutController,
  });

  @override
  State<CustomPinPutWidget> createState() => _CustomPinPutWidgetState();
}

class _CustomPinPutWidgetState extends State<CustomPinPutWidget> {
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
            controller: widget.pinPutController,
            // errorPinTheme
            errorPinTheme: pinTheme(
              textColor: AppColors.kRedTwo,
              borderColor: AppColors.kRedTwo,
              backGroundColor: AppColors.kWhite,
            ),

            // defaultPinTheme
            defaultPinTheme: pinTheme(
              textColor: AppColors.kWhite,
              borderColor: AppColors.kBorder,
              backGroundColor: AppColors.kBackGround,
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
