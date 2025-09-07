import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../core/components/custom_appbar_title.dart';
import '../../../../core/components/custom_icon_button.dart';
import '../../../../core/components/custom_primary_button.dart';
import '../../../../core/components/custom_tap_richtext.dart';
import '../../../../core/components/custom_text_form_field.dart';
import '../../../../core/components/show_custom_top_snack_bar.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/router/router.dart';
import '../../../data/provider/post/complete_profile_provider.dart';
import '../../../data/provider/provider.dart';
import '../widget/circle_avatar_widget.dart';

@RoutePage()
class CompleteProfilePage extends ConsumerStatefulWidget {
  const CompleteProfilePage({super.key});
  @override
  ConsumerState<CompleteProfilePage> createState() =>
      _CreateAnAccountPageState();
}

class _CreateAnAccountPageState extends ConsumerState<CompleteProfilePage> {
  final formKey = GlobalKey<FormState>();
  File? avatarFile;
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  // imagePickerGallery
  Future<void> imageGallery() async {
    final imageGallery = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (imageGallery == null) return;
    setState(() {
      avatarFile = File(imageGallery.path);
    });
  }

  Future<void> completeProfile() async {
    if (!formKey.currentState!.validate()) return;
    if (avatarFile == null) {
      showCustomErrorMessage(
        context,
        message: context.kAppLocalizations.pleasechooseanavatarimage,
      );
      return;
    } else {
      ref.read(prefsProvider).setString(AppStrings.file, avatarFile.toString());
    }
    final notifier = ref.read(completeProfileProvider.notifier);
    await notifier.completeProfile(
      name: nameController.text.trim(),
      userName: usernameController.text.trim(),
      avatar: avatarFile!,
    );
  }

  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    final state = ref.watch(completeProfileProvider);
    ref.listen(completeProfileProvider, (_, state) {
      if (state is CompleteProfileFailure) {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(message: state.errMessage),
        );
        return;
      }
      if (state is CompleteProfileSuccess) {
        showCustomSuccessMessage(
          context,
          message: local.profilecompletedsuccessfully,
        );
        context.router.replace(MainNavigationRoute());
      }
    });
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.kTwo, AppColors.kOne],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: SafeArea(
          child: Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: context.height * 0.020),
              children: [
                Row(
                  children: [
                    // Custom Icon Back
                    CustomIconButton(
                      icon: Icon(Icons.arrow_back_ios, color: AppColors.kWhite),
                      onPressed: () {
                        context.router.maybePop();
                      },
                    ),
                    //
                    Expanded(
                      child: Column(
                        children: [
                          CustomAppBarTitle(title: local.createanaccount),
                          SizedBox(height: context.height * 0.004),
                          // Rich Text
                          CustomTapRichText(
                            textSpanOne: local.alreadyhaveanaccount,
                            textSpanTwo: local.login,
                            onTap: () {
                              // Navigate to Login
                              context.router.replace(LoginRoute());
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: context.height * 0.016),
                // File
                CircleAvatarWidget(file: avatarFile, onPressed: imageGallery),
                SizedBox(height: context.height * 0.022),
                // Text: Username
                Text(
                  local.name,
                  style: context.kTextTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: context.height * 0.004),
                // Username FormField
                CustomTextFormField(
                  hintText: local.namemin,
                  hintStyle: context.kTextTheme.titleSmall!.copyWith(
                    color: AppColors.kGray,
                  ),
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return local.pleaseenteraname;
                    } else if (value.length < 4) {
                      return local.namemustbeatleastcharacters;
                    }
                    return null;
                  },
                ),
                SizedBox(height: context.height * 0.022),
                Text(
                  local.username,
                  style: context.kTextTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: context.height * 0.004),
                // Fullname FormField
                CustomTextFormField(
                  hintText: local.usernamemin,
                  hintStyle: context.kTextTheme.titleSmall!.copyWith(
                    color: AppColors.kGray,
                  ),
                  controller: usernameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return local.addcomment;
                    } else if (value.length < 4) {
                      return local.namemustbeatleastcharacters;
                    }
                    return null;
                  },
                ),
                SizedBox(height: context.height * 0.090),
                // Next Button
                CustomPrimaryButton(
                  title: local.next,
                  isLoading: state is CompleteProfileLoading,
                  gradient: LinearGradient(
                    colors: [AppColors.kEucalyptus, AppColors.kTurquoiseBlue],
                  ),
                  borderRadius: BorderRadius.circular(60),
                  padding: EdgeInsetsDirectional.symmetric(
                    vertical: context.height * 0.013,
                  ),
                  style: context.kTextTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.kWhite,
                  ),
                  // Navigate
                  onTap: completeProfile,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
