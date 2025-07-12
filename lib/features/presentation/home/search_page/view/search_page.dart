import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/components/custom_icon_button.dart';
import 'package:invesier/core/components/custom_list_tile_widget.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/constant/image_manger.dart';
import 'package:invesier/core/extension/extension.dart';
import 'package:invesier/features/model/home_follow_model.dart';
import 'package:invesier/features/presentation/home/home_follow_page/widget/home_follow_textformfield_widget.dart';

@RoutePage()
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorManger.k1, ColorManger.k2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: [
            Row(
              children: [
                // Custom IconButton
                CustomIconButton(
                  icon: Icon(Icons.arrow_back_ios, color: ColorManger.kWhite),
                  onPressed: () {
                    context.router.maybePop();
                  },
                ),
                ClipOval(
                  child: Image.asset(
                    ImageManger.kBoyFour,
                    width: 36,
                    height: 36,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: context.width * 0.015),
                // HomeFollow TextFormField Widget
                Expanded(child: HomeFollowTextFormFieldWidget()),
                SizedBox(width: context.width * 0.020),
              ],
            ),
            SizedBox(width: context.height * 0.020),
            ListView.builder(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
              shrinkWrap: true,
              itemCount: homeFollowModel.length,
              itemBuilder: (context, index) {
                return CustomListTileWidget(
                  // items Model
                  items: homeFollowModel[index],
                  broderColor: Colors.transparent,
                  backGroundColor: ColorManger.kTurquoiseBlue,
                  title: 'Chase',
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
