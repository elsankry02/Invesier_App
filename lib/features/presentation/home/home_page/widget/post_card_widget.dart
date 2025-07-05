import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invesier/core/components/custom_mate_container.dart';
import 'package:invesier/core/components/custom_trend_box.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/constant/image_manger.dart';
import 'package:invesier/core/constant/svg_manger.dart';
import 'package:invesier/core/extension/extension.dart';

class PostCardWidget extends StatelessWidget {
  const PostCardWidget({
    super.key,
    this.commentOnTap,
    this.imageOnTap,
    this.trailing,
  });
  final Function()? commentOnTap;
  final Function()? imageOnTap;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 10),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: ColorManger.kHeavyMetal,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: ClipOval(
              //! image
              child: GestureDetector(
                onTap: imageOnTap,
                child: Image.asset(
                  fit: BoxFit.cover,
                  height: 30,
                  width: 30,
                  ImageManger.kBoyThree,
                ),
              ),
            ),
            // User Pop Menu
            trailing: trailing,
            title: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! title
                    Text(
                      'Charlie White',
                      style: context.kTextTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    //! nk name
                    Text(
                      '@charlie_w',
                      style: context.kTextTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: context.width * 0.025),
                //! Custom Mate Container
                CustomMateContainer(title: 'Mate'),
              ],
            ),
          ),
          //! subTitle
          Text(
            'Green energy stocks are gaining traction. Investing \nin sustainable companies could be beneficial in the \nlong run.',
            style: context.kTextTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: context.height * 0.015),
          //! Custom Trend Box
          Row(
            spacing: 13,
            children: [
              //! Growth
              CustomTrendBox(
                svg: SvgManger.kGrowth,
                title: '12k',
                titleColor: ColorManger.kEucalyptus,
                borderColor: ColorManger.kEucalyptus,
                onTap: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Growth')));
                },
              ),
              CustomTrendBox(
                //! Decline
                svg: SvgManger.kDecline,
                title: '12K',
                titleColor: ColorManger.kRed,
                borderColor: ColorManger.kRed,
                onTap: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Decline')));
                },
              ),
              CustomTrendBox(
                //! Comment
                svg: SvgManger.kComment,
                title: '160K',
                titleColor: ColorManger.kBoulder,
                borderColor: ColorManger.kBoulder,
                onTap: commentOnTap,
              ),
              //! Sharing
              GestureDetector(
                child: SvgPicture.asset(SvgManger.kSharing),
                onTap: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Sharing')));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
