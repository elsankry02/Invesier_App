import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/components/custom_no_posts_widget.dart';

import '../../../../../core/components/custom_icon_button.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_images.dart';
import '../../../../../core/extension/extension.dart';
import '../widget/home_follow_textformfield_widget.dart';

@RoutePage()
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.kOne, AppColors.kTwo],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.only(top: 25),
            children: [
              Row(
                children: [
                  // Custom IconButton
                  CustomIconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.kWhite,
                    ),
                    onPressed: () {
                      context.router.maybePop();
                    },
                  ),
                  ClipOval(
                    child: Image.asset(
                      AppImages.kBoyFour,
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
              Center(child: CustomNoPostsWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
