import 'package:flutter/material.dart';
import 'package:invesier/constant/color_manger.dart';

class SkipWidget extends StatelessWidget {
  const SkipWidget({super.key, required this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final kText = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Text(
            'Skip',
            style: kText.titleMedium!.copyWith(
              color: ColorManger.kWhite,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
