import 'package:flutter/material.dart';
import '../../../../../core/constant/color_manger.dart';
import '../../../../model/home_follow_model.dart';
import 'home_follow_list_tile_widget.dart';

class FansWidget extends StatelessWidget {
  const FansWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: homeFollowModel.length,
        itemBuilder: (context, index) {
          return HomeFollowListTileWidget(
            items: homeFollowModel[index],
            broderColor: ColorManger.kSecondary,
            title: 'Fan',
          );
        },
      ),
    );
  }
}
