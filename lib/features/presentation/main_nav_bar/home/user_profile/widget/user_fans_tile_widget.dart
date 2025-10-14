import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/constant/app_text_theme.dart';

import '../../../../../../core/components/custom_circuler_progress.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/constant/app_images.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../data/models/get/get_user_fans_model.dart';

class UserFansTileWidget extends ConsumerWidget {
  final void Function()? onTap;
  final GetUserFansModel getUserFansModel;
  const UserFansTileWidget({
    super.key,
    this.onTap,
    required this.getUserFansModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(context.height * 0.040),
        child: CachedNetworkImage(
          imageUrl: getUserFansModel.avatarUrl ?? AppImages.ImageNetwork,
          width: context.height * 0.040,
          height: context.height * 0.040,
          fit: BoxFit.cover,
          errorWidget:
              (context, url, error) => Image.network(AppImages.ImageNetwork),
          placeholder: (context, url) => CustomCircularProgressIndicator(),
        ),
      ),
      title: Text(
        getUserFansModel.name ?? context.kAppLocalizations.name,
        style: AppTextTheme.kTitleSmall(context, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        "@${getUserFansModel.username ?? context.kAppLocalizations.username}",
        style: AppTextTheme.kTitleSmall(
          context,
          color: AppColors.kDarkenText,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: Container(
        padding: EdgeInsets.symmetric(
          vertical: context.height * 0.004,
          horizontal: context.height * 0.028,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.height * 0.031),
          border: Border.all(color: AppColors.kSecondary),
        ),
        child: Text(
          context.kAppLocalizations.fans,
          style: AppTextTheme.kLabelMedium(
            context,
            color: AppColors.kWhite,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
