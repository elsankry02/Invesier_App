import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invesier/features/provider/post/creat_post_provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/constant/color_manger.dart';
import '../../../../../core/extension/extension.dart';

@RoutePage()
class PostPage extends ConsumerStatefulWidget {
  const PostPage({super.key});

  @override
  ConsumerState<PostPage> createState() => _PostPageState();
}

class _PostPageState extends ConsumerState<PostPage> {
  File? file;
  final commentController = TextEditingController();
  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  imageGallery() async {
    final imageGallery = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (imageGallery == null) return;

    setState(() {
      file = File(imageGallery.path);
    });
  }

  imagecamera() async {
    final imagecamera = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (imagecamera == null) return;

    setState(() {
      file = File(imagecamera.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createPostProvider);
    log("State == $state");
    final notifier = ref.read(createPostProvider.notifier);
    ref.listen(createPostProvider, (_, state) {
      if (state is CreatPostFailure) {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(message: state.errMassege),
        );
      }
    });
    return Scaffold(
      body: Container(
        padding: EdgeInsetsDirectional.only(top: 5, start: 20, end: 20),
        width: context.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorManger.k1, ColorManger.k2],
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
                      IconButton(
                        onPressed: () {
                          context.router.maybePop();
                        },
                        icon: Icon(FontAwesomeIcons.xmark),
                      ),
                    ],
                  ),
                  SizedBox(height: context.height * 0.012),
                  // TextFormField
                  TextFormField(
                    cursorColor: ColorManger.kWhite,
                    controller: commentController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: "We post money related content.....",
                      hintStyle: TextStyle(
                        color: ColorManger.kGray,
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
                      IconButton(
                        onPressed: () {
                          imageGallery();
                        },
                        icon: Icon(
                          FontAwesomeIcons.image,
                          color: ColorManger.kOceanGreen,
                        ),
                      ),
                      // imagecamera
                      IconButton(
                        onPressed: () {
                          imagecamera();
                        },
                        icon: Icon(
                          FontAwesomeIcons.video,
                          color: ColorManger.kOceanGreen,
                        ),
                      ),
                    ],
                  ),

                  // Post now
                  CustomPrimaryButton(
                    isLoading: state is CreatPostLoading,
                    title: 'Post now',
                    backGroundColor: ColorManger.kOceanGreen,
                    borderColor: ColorManger.kOceanGreen,
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    radius: 16,
                    style: context.kTextTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ColorManger.kDivider,
                    ),
                    onTap: () async {
                      log("hhhhhhhhhhh=====");
                      await notifier.createPost(
                        content: commentController.text.trim(),
                      );
                    },
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
