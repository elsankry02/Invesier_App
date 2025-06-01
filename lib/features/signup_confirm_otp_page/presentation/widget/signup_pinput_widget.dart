import 'package:flutter/material.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:pinput/pinput.dart';

class SignupPinputWidget extends StatefulWidget {
  const SignupPinputWidget({
    super.key,
    this.onChanged,
    this.validator,
    this.controller,
  });
  final TextEditingController? controller;
  final Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  @override
  State<SignupPinputWidget> createState() => _LogInPinPutWidgetState();
}

class _LogInPinPutWidgetState extends State<SignupPinputWidget> {
  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      controller: widget.controller,
      errorPinTheme: pinTheme(
        textColor: ColorManger.kWhite,
        borderColor: ColorManger.kPersianRed,
        backGroundColor: ColorManger.kAppBar,
      ),
      defaultPinTheme: pinTheme(
        textColor: ColorManger.kWhite,
        borderColor: ColorManger.kBorder,
        backGroundColor: ColorManger.kAppBar,
      ),
      onChanged: widget.onChanged,
      validator: widget.validator,
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
