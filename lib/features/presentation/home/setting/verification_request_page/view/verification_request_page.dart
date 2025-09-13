import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/components/custom_appbar_widget.dart';
import '../../../../../../core/components/custom_primary_button.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/constant/app_images.dart';
import '../../../../../../core/constant/app_svgs.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/func/show_top_snack_bar.dart';
import '../../../../../../core/router/router.dart';
import '../../../../../data/provider/get/get_authenticated_user_provider.dart';
import '../widget/icon_label_tile.dart';
import '../widget/labeled_text_field.dart';
import '../widget/upload_button_field.dart';

@RoutePage()
class VerificationRequestPage extends ConsumerStatefulWidget {
  const VerificationRequestPage({super.key});

  @override
  ConsumerState<VerificationRequestPage> createState() =>
      _VerificationRequestPageState();
}

class _VerificationRequestPageState
    extends ConsumerState<VerificationRequestPage> {
  final jopTitleController = TextEditingController();
  final socialLinksController = TextEditingController();
  final companyNameController = TextEditingController();
  @override
  void dispose() {
    jopTitleController.dispose();
    socialLinksController.dispose();
    companyNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    final state = ref.watch(getAuthenticatedUserProvider);
    if (state is GetAuthenticatedUserSuccess) {
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
              padding: EdgeInsets.all(12),
              children: [
                CustomAppBarWidget(title: local.verificationrequest),
                SizedBox(height: context.height * 0.035),
                Image.asset(
                  AppImages.kVerification,
                  height: context.height * 0.1,
                  width: context.height * 0.1,
                ),
                SizedBox(height: context.height * 0.020),
                Image.asset(AppImages.kProgressBarOne),
                SizedBox(height: context.height * 0.024),
                IconLabelTile(
                  svg: AppSvgs.kPrsonal,
                  title: state.userModel.name,
                ),
                IconLabelTile(
                  svg: AppSvgs.kEmail,
                  title: state.userModel.email,
                ),
                IconLabelTile(
                  svg: AppSvgs.kPhone,
                  title: state.userModel.phone ?? "01204******",
                ),
                LabeledTextField(
                  joptile: local.jobtitle,
                  hintText: local.finance,
                  controller: jopTitleController,
                ),
                SizedBox(height: context.height * 0.016),
                LabeledTextField(
                  joptile: local.companyname,
                  hintText: local.bankelahly,
                  controller: companyNameController,
                ),
                SizedBox(height: context.height * 0.016),
                LabeledTextField(
                  joptile: local.sociallinks,
                  hintText: "elsankry02.tiktok.net",
                  controller: socialLinksController,
                ),
                SizedBox(height: context.height * 0.024),
                Text(
                  local.uploadidpassport,
                  style: context.kTextTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: context.height * 0.004),
                UploadButtonField(
                  title: local.taptouploadfront,
                  onTap: () => ErrorMessage(context, message: local.comingsoon),
                ),
                UploadButtonField(
                  title: local.taptouploadback,
                  onTap: () => ErrorMessage(context, message: local.comingsoon),
                ),
                SizedBox(height: context.height * 0.058),
                CustomPrimaryButton(
                  title: local.sendrequest,
                  backGroundColor: AppColors.kTurquoiseBlue,
                  borderRadius: BorderRadius.circular(31),
                  padding: EdgeInsets.symmetric(
                    horizontal: context.height * 0.112,
                    vertical: context.height * 0.011,
                  ),
                  style: context.kTextTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  onTap: () => context.router.replace(UnderReveiwRoute()),
                ),
              ],
            ),
          ),
        ),
      );
    }
    if (state is GetAuthenticatedUserFaliure) {
      Text(state.errMessage);
    }
    return Center(child: CircularProgressIndicator());
  }
}
