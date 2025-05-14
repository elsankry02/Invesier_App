import 'package:flutter/material.dart';
import 'package:invesier/constant/color_manger.dart';

class SkipWidget extends StatelessWidget {
  const SkipWidget({super.key, required this.onTap, required this.skip});

  final void Function()? onTap;
  final String skip;

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Text(
            skip,
            style: appTextTheme.titleMedium!.copyWith(
              color: ColorManger.kWhite,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
