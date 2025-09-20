import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../../data/models/get/get_user_profile_model.dart';

import '../../../../../../core/components/custom_icon_button.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/extension/extension.dart';

class UserFollowersAppBarWidget extends StatelessWidget {
  final GetUserProfileModel getUserProfileModel;
  const UserFollowersAppBarWidget({
    super.key,
    required this.getUserProfileModel,
  });
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
              getUserProfileModel.avatarUrl,
              width: context.height * 0.025,
              height: context.height * 0.025,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      title: Text(
        getUserProfileModel.name,
        style: context.kTextTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        getUserProfileModel.username,
        style: context.kTextTheme.bodySmall!.copyWith(
          color: AppColors.kGray,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
