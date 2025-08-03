import 'package:flutter/material.dart';

import '../../../../../core/components/custom_follow_user_tile.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../model/follow_model.dart';

class FansWidget extends StatelessWidget {
  const FansWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: homeFollowModel.length,
        itemBuilder: (context, index) {
          return CustomFollowUserTile(
            // items Model
            items: homeFollowModel[index],
            broderColor: AppColors.kSecondary,
            title: 'Fan',
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 28,
              vertical: 4,
            ),
          );
        },
      ),
    );
  }
}
