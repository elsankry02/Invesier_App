import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constant/color_manger.dart';
import '../../../../../core/constant/svg_manger.dart';

class HomeFollowTextFormFieldWidget extends StatelessWidget {
  const HomeFollowTextFormFieldWidget({super.key, this.searchController});
  final TextEditingController? searchController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorManger.kDarkenText,
      controller: searchController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        // prefixIcon
        prefixIcon: UnconstrainedBox(
          child: SvgPicture.asset(SvgManger.kSearch),
        ),
        // Search
        hintText: 'Search',
        hintStyle: TextStyle(fontSize: 17, color: ColorManger.kDarkenText),
        filled: true,
        fillColor: ColorManger.kHeavyMetal,
        enabledBorder: outlineInputBorder(borderColor: ColorManger.kHeavyMetal),
        focusedBorder: outlineInputBorder(borderColor: ColorManger.kHeavyMetal),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder({required Color borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(96),
      borderSide: BorderSide(color: borderColor),
    );
  }
}
