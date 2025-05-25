import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invesier/constant/color_manger.dart';

class CustomOrConnectWith extends StatelessWidget {
  const CustomOrConnectWith({super.key, required this.assetName, this.onTap});
  final String assetName;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
