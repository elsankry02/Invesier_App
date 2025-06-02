import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constant/color_manger.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({
    super.key,
    required this.onTapGoogle,
    required this.assetName,
  });

  final void Function()? onTapGoogle;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapGoogle,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 11, horizontal: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorManger.kWhite,
        ),
        child: SvgPicture.asset(assetName),
      ),
    );
  }
}
