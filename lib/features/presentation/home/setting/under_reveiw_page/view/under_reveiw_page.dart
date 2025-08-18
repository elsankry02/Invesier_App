import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/components/custom_appbar_widget.dart';
import 'package:invesier/core/components/custom_primary_button.dart';
import 'package:invesier/core/constant/app_colors.dart';
import 'package:invesier/core/constant/app_images.dart';
import 'package:invesier/core/extension/extension.dart';
import 'package:invesier/core/router/router.dart';

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
            padding: EdgeInsets.all(18),
            children: [
              CustomAppBarWidget(title: "verification request"),
              SizedBox(height: context.height * 0.035),
              Image.asset(AppImages.kProgressBarTwo),
              SizedBox(height: context.height * 0.043),
              Image.asset(AppImages.kLoadingFiles, height: 100, width: 100),
              SizedBox(height: context.height * 0.034),
              Text(
                textAlign: TextAlign.center,
                "Your verification request has been \nsent successfully !",
                style: context.kTextTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: context.height * 0.018),
              CustomPrimaryButton(
                padding: EdgeInsets.all(16),
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [AppColors.kOne, AppColors.kTwo],
                  begin: AlignmentGeometry.topRight,
                  end: AlignmentGeometry.bottomLeft,
                ),
                title:
                    "We will let you know when your verification \nrequest has been reveiwed",
                style: context.kTextTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                onTap: () => context.router.push(RejectedRoute()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
