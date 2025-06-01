import 'package:flutter/material.dart';
import 'package:invesier/core/constant/color_manger.dart';

class CustomButtonStyleEnum extends StatelessWidget {
  const CustomButtonStyleEnum({
    super.key,
    required this.title,
    required this.titleColor,
    required this.color,
    required this.onTap,
    this.topRight = 0,
    this.topLeft = 0,
    this.bottomLeft = 0,
    this.bottomRight = 0,
  });
  final String title;
  final Color color;
  final Color titleColor;
  final double? topLeft;
  final double? topRight;
  final double? bottomLeft;
  final double? bottomRight;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    final kTextTheme = Theme.of(context).textTheme;
    return GestureDetector(
      //! onTap
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.5, horizontal: 52),
        decoration: BoxDecoration(
          //! colorcolor
          color: color,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(topRight!),
            //! topRight
            bottomLeft: Radius.circular(bottomLeft!),
            //! bottomLeft
            bottomRight: Radius.circular(bottomRight!),
            //! bottomRight
            topLeft: Radius.circular(topLeft!),
          ),
          border: Border.all(color: ColorManger.kTurquoiseBlue),
        ),
        child: Center(
          child: Text(
            //! title
            title,
            style: kTextTheme.titleMedium!.copyWith(
              //! titleColor
              color: titleColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
