import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/constant/app_svgs.dart';
import '../../../../../../core/extension/extension.dart';

class SearchTextFormFieldWidget extends StatelessWidget {
  final TextEditingController? searchController;
  final void Function(String value)? onFieldSubmitted, onChanged;
  const SearchTextFormFieldWidget({
    super.key,
    this.searchController,
    this.onFieldSubmitted,
    this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      cursorColor: AppColors.kDarkenText,
      controller: searchController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        // prefixIcon
        prefixIcon: UnconstrainedBox(child: SvgPicture.asset(AppSvgs.kSearch)),
        // Search
        hintText: local.search,
        hintStyle: TextStyle(fontSize: 17, color: AppColors.kDarkenText),
        filled: true,
        fillColor: AppColors.kHeavyMetal,
        enabledBorder: outlineInputBorder(borderColor: AppColors.kHeavyMetal),
        focusedBorder: outlineInputBorder(borderColor: AppColors.kHeavyMetal),
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
