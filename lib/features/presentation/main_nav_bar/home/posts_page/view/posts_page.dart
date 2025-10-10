import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../data/providers/get/get_posts_provider.dart';

import '../../../../../../core/components/custom_icon_button.dart';
import '../../../../../../core/components/custom_primary_button.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/func/show_top_snack_bar.dart';
import '../../../../../data/providers/post/create_post_provider.dart';
import '../widget/post_app_bar_widget.dart';

@RoutePage()
class PostsPage extends ConsumerStatefulWidget {
  const PostsPage({super.key});

  @override
  ConsumerState<PostsPage> createState() => _PostPageState();
}

class _PostPageState extends ConsumerState<PostsPage> {
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
    if (contentController.text.trim().isEmpty && file == null) {
      return ErrorMessage(
        context,
        message:
            context.kAppLocalizations.pleasewritecontentoraddimagebeforesharing,
      );
    }
    final notifier = ref.read(createPostProvider.notifier);
    await notifier.createPost(content: contentController.text.trim());
    context.router.maybePop();
  }

  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    final state = ref.watch(createPostProvider);
    ref.listen(createPostProvider, (_, state) {
      if (state is CreatePostFailure) {
        ErrorMessage(context, message: state.errMessage);
      } else if (state is CreatePostSuccess) {
        SuccessMessage(
          context,
          message: context.kAppLocalizations.postpublishsuccessfully,
        );
        ref.read(getPostsProvider.notifier).getPosts();
      }
    });
    return Scaffold(
      body: Container(
        padding: EdgeInsetsDirectional.only(
          top: context.height * 0.005,
          start: context.height * 0.015,
          end: context.height * 0.015,
        ),
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
                  PostAppBarWidget(),
                  SizedBox(height: context.height * 0.012),
                  TextFormField(
                    cursorColor: AppColors.kWhite,
                    controller: contentController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: local.wepostmoneyrelatedcontent,
                      hintStyle: TextStyle(
                        color: AppColors.kGray,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                  SizedBox(height: context.height * 0.012),
                  SizedBox(
                    child:
                        file == null
                            ? null
                            : ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                file!,
                                fit: BoxFit.cover,
                                height: context.height * 0.400,
                                width: context.width * 0.200,
                              ),
                            ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: context.height * 0.012),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomIconButton(
                        onPressed: () => gallery(),
                        icon: Icon(
                          FontAwesomeIcons.image,
                          color: AppColors.kNum,
                        ),
                      ),
                      CustomIconButton(
                        onPressed: () => camera(),

                        icon: Icon(
                          FontAwesomeIcons.video,
                          color: AppColors.kNum,
                        ),
                      ),
                    ],
                  ),
                  CustomPrimaryButton(
                    isLoading: state is CreatePostLoading,
                    title: local.postnow,
                    backGroundColor: AppColors.kNum,
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: context.height * 0.020,
                      vertical: context.height * 0.012,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    style: context.kTextTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.kBackGround,
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
