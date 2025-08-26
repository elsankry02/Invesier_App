import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/constant/app_colors.dart';
import 'package:invesier/core/constant/app_images.dart';
import 'package:invesier/core/router/router.dart';
import 'package:invesier/features/presentation/home/setting/under_reveiw_page/widget/verification_success_widget.dart';

@RoutePage()
class UnderReveiwPage extends StatelessWidget {
  const UnderReveiwPage({super.key});

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
            padding: EdgeInsets.all(20),
            children: [
              VerificationSuccessWidget(
                title:
                    "Your verification request has been \nsent successfully !",
                subTitle:
                    "We will let you know when your verification \nrequest has been reveiwed",
                imageOne: AppImages.kProgressBarTwo,
                imageTwo: AppImages.kLoadingFiles,
                onTap: () => context.router.replace(RejectedRoute()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
