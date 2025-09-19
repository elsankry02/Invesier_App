import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../data/models/get/get_user_pioneers_model.dart';

import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/extension/extension.dart';

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
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          height: context.height * 0.040,
          width: context.height * 0.040,
          fit: BoxFit.cover,
          getUserPioneersModel.avatarUrl,
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
          color: AppColors.kBackGround,
          border: Border.all(color: AppColors.kPrimary),
        ),
        child: Text(
          "Pioneer",
          style: context.kTextTheme.labelMedium!.copyWith(
            color: AppColors.kWhite,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
