import 'package:flutter/material.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/features/model/home_follow_model.dart';
import 'package:invesier/features/presentation/home/home_follow_page/widget/home_follow_list_tile_widget.dart';

class PioneersWidget extends StatelessWidget {
  const PioneersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: homeFollowModel.length,
        itemBuilder: (context, index) {
          return HomeFollowListTileWidget(
            items: homeFollowModel[index],
            broderColor: ColorManger.kPrimary,
            title: 'Pioneer',
          );
        },
      ),
    );
  }
}
