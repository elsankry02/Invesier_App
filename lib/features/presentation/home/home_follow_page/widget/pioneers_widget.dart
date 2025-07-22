import 'package:flutter/material.dart';

import '../../../../../core/components/custom_list_tile_widget.dart';
import '../../../../../core/constant/color_manger.dart';
import '../../../../model/home_follow_model.dart';

class PioneersWidget extends StatelessWidget {
  const PioneersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: homeFollowModel.length,
        itemBuilder: (context, index) {
          return CustomListTileWidget(
            // items Model
            items: homeFollowModel[index],
            broderColor: ColorManger.kTurquoiseBlue,
            title: 'Pioneer',
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 16,
              vertical: 4,
            ),
          );
        },
      ),
    );
  }
}
