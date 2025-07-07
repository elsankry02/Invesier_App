import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant/color_manger.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  final void Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTapGoogle
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 11, horizontal: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorManger.kWhite,
        ),
        // title
        child: SvgPicture.asset(title),
      ),
    );
  }
}
