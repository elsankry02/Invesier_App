import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/features/model/user_model.dart';

import '../../../../../core/components/custom_icon_button.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/extension/extension.dart';

class HomeFollowAppBarWidget extends StatelessWidget {
  final UserModel userModel;
  const HomeFollowAppBarWidget({super.key, required this.userModel});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Custom Icon Back
          CustomIconButton(
            icon: Icon(Icons.arrow_back_ios, color: AppColors.kWhite),
            onPressed: () {
              context.router.maybePop();
            },
          ),
          // Image
          ClipOval(
            child: Image.network(
              userModel.avatarUrl,
              width: 25,
              height: 25,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      // title
      title: Text(
        userModel.name,
        style: context.kTextTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      // subTitle
      subtitle: Text(
        userModel.username,
        style: context.kTextTheme.bodySmall!.copyWith(
          color: AppColors.kGray,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
