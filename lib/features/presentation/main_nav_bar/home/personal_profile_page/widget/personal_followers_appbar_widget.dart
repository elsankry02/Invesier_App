import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/constant/app_text_theme.dart';

import '../../../../../../core/components/custom_icon_button.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../data/models/user_model.dart';

class PersonalFollowersAppBarWidget extends StatelessWidget {
  final UserModel userModel;
  const PersonalFollowersAppBarWidget({super.key, required this.userModel});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomIconButton(
            icon: Icon(Icons.arrow_back_ios, color: AppColors.kWhite),
            onPressed: () {
              context.router.maybePop();
            },
          ),
          ClipOval(
            child: Image.network(
              userModel.avatarUrl,
              width: context.height * 0.025,
              height: context.height * 0.025,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      title: Text(
        userModel.name,
        style: AppTextTheme.kBodySmall(context, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        userModel.username,
        style: AppTextTheme.kBodySmall(
          context,
          color: AppColors.kGray,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
