import 'package:flutter/material.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:pinput/pinput.dart';

class LogInPinPutWidget extends StatefulWidget {
  const LogInPinPutWidget({super.key});

  @override
  State<LogInPinPutWidget> createState() => _LogInPinPutWidgetState();
}

class _LogInPinPutWidgetState extends State<LogInPinPutWidget> {
  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Pinput(
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
        backGroundColor: ColorManger.kAppBar,
      ),
      onChanged: (value) {},
      validator: (value) {
        if (value!.length < 6) {
          return 'Wrong code, try again';
        }
        return null;
      },
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
