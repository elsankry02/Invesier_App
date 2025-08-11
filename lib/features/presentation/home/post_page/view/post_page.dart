import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invesier/core/components/custom_icon_button.dart';

import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/components/show_custom_top_snack_bar.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../provider/post/creat_post_provider.dart';

@RoutePage()
class PostPage extends ConsumerStatefulWidget {
  const PostPage({super.key});

  @override
  ConsumerState<PostPage> createState() => _PostPageState();
}

class _PostPageState extends ConsumerState<PostPage> {
  File? file;
  final contentController = TextEditingController();
  @override
  void dispose() {
    contentController.dispose();
    super.dispose();
  }

  Future<void> gallery() async {
    final imageGallery = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (imageGallery == null) return;

    setState(() {
      file = File(imageGallery.path);
    });
  }

  Future<void> camera() async {
    final imageCamera = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (imageCamera == null) return;

    setState(() {
      file = File(imageCamera.path);
    });
  }

  Future<void> createPost() async {
    if (file == null) {
      showCustomErrorMessage(
        context,
        message: "Select an image from your Gallery or Camera",
      );
      return;
    }
    final notifier = ref.read(createPostProvider.notifier);
    await notifier.createPost(content: contentController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createPostProvider);
    ref.listen(createPostProvider, (_, state) {
      if (state is CreatPostFailure) {
        showCustomErrorMessage(context, message: state.errMessage);
      }
    });
    return Scaffold(
      body: Container(
        padding: EdgeInsetsDirectional.only(top: 5, start: 20, end: 20),
        width: context.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.kOne, AppColors.kTwo],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: context.height * 0.004),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // titel
                      Text(
                        "Add Post",
                        style: context.kTextTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      // icon
                      CustomIconButton(
                        icon: Icon(FontAwesomeIcons.xmark),
                        onPressed: () {
                          context.router.maybePop();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: context.height * 0.012),
                  // TextFormField
                  TextFormField(
                    cursorColor: AppColors.kWhite,
                    controller: contentController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: "We post money related content.....",
                      hintStyle: TextStyle(
                        color: AppColors.kGray,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                  SizedBox(height: context.height * 0.012),
                  //  Image
                  SizedBox(
                    child:
                        file == null
                            ? null
                            : ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(file!, fit: BoxFit.cover),
                            ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // imageGallery
                      CustomIconButton(
                        onPressed: () {
                          gallery();
                        },
                        icon: Icon(
                          FontAwesomeIcons.image,
                          color: AppColors.kOceanGreen,
                        ),
                      ),
                      // imagecamera
                      CustomIconButton(
                        onPressed: () {
                          camera();
                        },
                        icon: Icon(
                          FontAwesomeIcons.video,
                          color: AppColors.kOceanGreen,
                        ),
                      ),
                    ],
                  ),

                  // Post now
                  CustomPrimaryButton(
                    isLoading: state is CreatPostLoading,
                    title: 'Post now',
                    backGroundColor: AppColors.kOceanGreen,
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    radius: 16,
                    style: context.kTextTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.kDivider,
                    ),
                    onTap: createPost,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
