import 'package:flutter/material.dart';

class SkipWidget extends StatelessWidget {
  const SkipWidget({super.key, required this.onTap, required this.skip});

  final void Function()? onTap;
  final String skip;

  @override
  Widget build(BuildContext context) {
    final kTextTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          //! onTap
          onTap: onTap,
          child: Text(
            //! skip
            skip,
            style: kTextTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
