import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/components/custom_primary_button.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/constant/app_images.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/router/router.dart';
import '../../under_reveiw_page/widget/verification_success_widget.dart';

@RoutePage()
class YouAreVerifiedPage extends StatelessWidget {
  const YouAreVerifiedPage({super.key});

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
                title: "You're verified !",
                subTitle:
                    "Your request has been approved. You can now enjoy our premium feature",
                imageOne: AppImages.kProgressBarFour,
                imageTwo: AppImages.kVerified,
              ),
              SizedBox(height: context.height * 0.114),
              CustomPrimaryButton(
                title: "Back to home page",
                backGroundColor: AppColors.kTurquoiseBlue,
                borderRadius: BorderRadius.circular(31),
                padding: EdgeInsets.symmetric(
                  horizontal: context.height * 0.112,
                  vertical: context.height * 0.011,
                ),
                style: context.kTextTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                onTap: () => context.router.replace(VerificationRequestRoute()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
