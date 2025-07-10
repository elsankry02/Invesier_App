import 'package:flutter/material.dart';

import '../../../../../core/components/custom_list_tile_widget.dart';
import '../../../../../core/constant/color_manger.dart';
import '../../../../model/home_follow_model.dart';

class FansWidget extends StatelessWidget {
  const FansWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: homeFollowModel.length,
        itemBuilder: (context, index) {
          return CustomListTileWidget(
            // items Model
            items: homeFollowModel[index],
            broderColor: ColorManger.kSecondary,
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
