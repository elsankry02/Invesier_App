import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../core/components/custom_icon_button.dart';
import '../../../../core/components/custom_primary_button.dart';
import '../../../../core/components/custom_rich_text.dart';
import '../../../../core/components/custom_text_form_field.dart';
import '../../../../core/components/custom_title_appbar.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/router/router.dart';
import '../../../provider/post/complete_profile_provider.dart';
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
  imageGallery() async {
    final imageGallery = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (imageGallery == null) return;
    setState(() {
      avatarFile = File(imageGallery.path);
    });
  }

  Future<void> completeProfile() async {
    if (avatarFile == null) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(message: "Please choose an avatar image"),
      );
      return;
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
    final state = ref.watch(completeProfileProvider);
    // final notifier = ref.read(completeProfileProvider.notifier);
    ref.listen(completeProfileProvider, (_, state) {
      if (state is CompleteProfileFailure) {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(message: state.errMessage),
        );
        log(state.errMessage);
        return;
      }
      if (state is CompleteProfileSuccess) {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.success(message: "successfully"),
        );
        context.router.replace(BottomNavigationBarRoute());
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
              padding: EdgeInsets.symmetric(horizontal: 20),
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
                          CustomTitelAppBar(title: 'Create an account'),
                          SizedBox(height: context.height * 0.004),
                          // Rich Text
                          CustomRichText(
                            textSpanOne: 'Already have an account?',
                            textSpanTwo: ' Log in',
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
                  'Name',
                  style: context.kTextTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: context.height * 0.004),
                // Username FormField
                CustomTextFormField(
                  title: 'name',
                  hintStyle: context.kTextTheme.titleSmall!.copyWith(
                    color: AppColors.kGray,
                  ),
                  controller: nameController,
                ),
                SizedBox(height: 22),
                Text(
                  'User Name',
                  style: context.kTextTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                // Fullname FormField
                CustomTextFormField(
                  title: 'username',
                  hintStyle: context.kTextTheme.titleSmall!.copyWith(
                    color: AppColors.kGray,
                  ),
                  controller: usernameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(height: context.height * 0.090),
                // Next Button
                CustomPrimaryButton(
                  title: 'Next',
                  isLoading: state is CompleteProfileLoading,
                  gradient: LinearGradient(
                    colors: [AppColors.kEucalyptus, AppColors.kTurquoiseBlue],
                  ),
                  borderColor: AppColors.kTurquoiseBlue,
                  radius: 60,
                  padding: EdgeInsetsDirectional.symmetric(vertical: 13),
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
