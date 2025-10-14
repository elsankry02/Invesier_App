import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/constant/app_text_theme.dart';

import '../../../../../../../core/components/custom_primary_button.dart';
import '../../../../../../../core/constant/app_colors.dart';
import '../../../../../../../core/constant/app_images.dart';
import '../../../../../../../core/extension/extension.dart';
import '../../under_reveiw_page/widget/verification_success_widget.dart';
import '../widget/rejected_dialog_widget.dart';

@RoutePage()
class RejectedPage extends StatelessWidget {
  const RejectedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
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
                title: local.requestnotapproved,
                subTitle: local.thiscouldbeduetomissingorincorrectinformation,
                imageOne: AppImages.kProgressBarThree,
                imageTwo: AppImages.kNotApproved,
              ),
              SizedBox(height: context.height * 0.110),
              CustomPrimaryButton(
                title: local.sendnewrequest,
                backGroundColor: AppColors.kTurquoiseBlue,
                borderRadius: BorderRadius.circular(31),
                padding: EdgeInsets.symmetric(
                  horizontal: context.height * 0.112,
                  vertical: context.height * 0.011,
                ),
                style: AppTextTheme.kTitleMedium(
                  context,
                  fontWeight: FontWeight.w500,
                ),
                onTap:
                    () => showDialog(
                      context: context,
                      builder: (context) {
                        return RejectedDialogWidget();
                      },
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
