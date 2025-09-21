import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/components/custom_circuler_progress.dart';
import 'package:invesier/core/constant/app_images.dart';

import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../data/models/get/get_user_pioneers_model.dart';

class UserPioneersTileWidget extends ConsumerWidget {
  final void Function()? onTap;
  final GetUserPioneersModel getUserPioneersModel;
  const UserPioneersTileWidget({
    super.key,
    this.onTap,
    required this.getUserPioneersModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: onTap,
      leading: ClipRRect(
        child: CachedNetworkImage(
          imageUrl: getUserPioneersModel.avatarUrl ?? AppImages.ImageNetwork,
          width: context.height * 0.040,
          height: context.height * 0.040,
          fit: BoxFit.cover,
          errorWidget:
              (context, url, error) => Image.network(AppImages.ImageNetwork),
          placeholder: (context, url) => CustomCircularProgressIndicator(),
        ),
      ),
      title: Text(
        getUserPioneersModel.name,
        style: context.kTextTheme.titleSmall!.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        getUserPioneersModel.username,
        style: context.kTextTheme.titleSmall!.copyWith(
          color: AppColors.kDarkenText,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: Container(
        padding: EdgeInsets.symmetric(
          vertical: context.height * 0.004,
          horizontal: context.height * 0.020,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.height * 0.031),
          border: Border.all(color: AppColors.kPrimary),
        ),
        child: Text(
          context.kAppLocalizations.pioneers,
          style: context.kTextTheme.labelMedium!.copyWith(
            color: AppColors.kWhite,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
