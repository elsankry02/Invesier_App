import 'package:flutter/material.dart';
import 'package:invesier/core/constant/app_colors.dart';
import 'package:invesier/core/extension/extension.dart';
import 'package:invesier/features/data/models/get_user_profile_model.dart';

class SearchTileWidget extends StatelessWidget {
  final void Function()? onTap;
  final GetUserProfileModel getUserProfileModel;
  const SearchTileWidget({
    super.key,
    this.onTap,
    required this.getUserProfileModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          height: context.height * 0.040,
          width: context.height * 0.040,
          fit: BoxFit.cover,
          getUserProfileModel.avatarUrl,
        ),
      ),
      title: Text(
        getUserProfileModel.name,
        style: context.kTextTheme.titleSmall!.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        getUserProfileModel.username,
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
          "Chase",
          style: context.kTextTheme.labelMedium!.copyWith(
            color: AppColors.kWhite,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
