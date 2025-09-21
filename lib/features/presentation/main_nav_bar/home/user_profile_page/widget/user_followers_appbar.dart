import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/components/custom_circuler_progress.dart';
import 'package:invesier/core/constant/app_images.dart';
import 'package:invesier/features/data/models/get/get_user_profile_model.dart';

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
            child: CachedNetworkImage(
              imageUrl: getUserProfileModel.avatarUrl ?? AppImages.ImageNetwork,
              width: context.height * 0.025,
              height: context.height * 0.025,
              fit: BoxFit.cover,
              errorWidget:
                  (context, url, error) =>
                      Image.network(AppImages.ImageNetwork),
              placeholder: (context, url) => CustomCircularProgressIndicator(),
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
