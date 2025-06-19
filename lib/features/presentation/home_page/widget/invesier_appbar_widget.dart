import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/constant/image_manger.dart';
import 'package:invesier/core/constant/svg_manger.dart';
import 'package:invesier/core/extension/extension.dart';

class InvesierAppBar extends StatelessWidget {
  const InvesierAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 20, end: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //! Logo
          SvgPicture.asset(SvgManger.kInvinserLogo),
          SizedBox(
            width: context.width * 0.250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //! Search Icon GestureDetector
                GestureDetector(onTap: () {}, child: Icon(Icons.search)),
                //! notifications GestureDetector
                GestureDetector(
                  onTap: () {},
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Icon(Icons.notifications_none_rounded),
                      Container(
                        height: 8,
                        width: 8,
                        decoration: const BoxDecoration(
                          color: ColorManger.kPersianRed,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
                //! Image GestureDetector
                GestureDetector(
                  onTap: () {},
                  child: ClipOval(
                    child: Image.asset(
                      ImageManger.kExperience,
                      fit: BoxFit.cover,
                      height: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
