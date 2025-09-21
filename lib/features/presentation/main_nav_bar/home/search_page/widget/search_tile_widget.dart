import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/components/custom_circuler_progress.dart';
import 'package:invesier/core/constant/app_images.dart';
import 'package:invesier/features/data/models/get/get_list_users_model.dart';

import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/extension/extension.dart';

class SearchTileWidget extends StatelessWidget {
  final void Function()? onTap;
  final Datum getListUsers;
  const SearchTileWidget({super.key, this.onTap, required this.getListUsers});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CachedNetworkImage(
          imageUrl: getListUsers.avatar ?? AppImages.ImageNetwork,
          height: context.height * 0.040,
          width: context.height * 0.040,
          fit: BoxFit.cover,
          placeholder: (context, url) => CustomCircularProgressIndicator(),
          errorWidget:
              (context, url, error) => Image.network(AppImages.ImageNetwork),
        ),
      ),
      title: Text(
        getListUsers.name,
        style: context.kTextTheme.titleSmall!.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        getListUsers.username,
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
          color: AppColors.kPrimary,
        ),
        child: Text(
          context.kAppLocalizations.chase,
          style: context.kTextTheme.labelMedium!.copyWith(
            color: AppColors.kWhite,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
