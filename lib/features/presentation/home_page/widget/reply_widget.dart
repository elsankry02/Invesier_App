import 'package:flutter/material.dart';
import 'package:invesier/core/components/custom_mate_container.dart';
import 'package:invesier/core/components/custom_trend_box.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/constant/image_manger.dart';
import 'package:invesier/core/constant/svg_manger.dart';
import 'package:invesier/core/extension/extension.dart';
import 'package:invesier/features/presentation/home_page/widget/pop_menu_button_widget.dart';

class ReplyWidget extends StatelessWidget {
  const ReplyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
      child: Column(
        spacing: 16,
        children: [
          Container(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
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
                    child: Image.asset(
                      ImageManger.kReplyImage,
                      height: 30,
                      width: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                  trailing: PopMenuButtonWidget(),
                  title: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //! title
                          Text(
                            'Fred Blue',
                            style: context.kTextTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          //! nk name
                          Text(
                            '@Blue234',
                            style: context.kTextTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: context.width * 0.025),
                      //! Custom Mate Container
                      CustomMateContainer(
                        backGroundColor: ColorManger.kTurquoiseBlue,
                        title: 'Chase back',
                      ),
                    ],
                  ),
                ),
                //! subTitle
                Text(
                  'Lorem ipsum dolor sit amet, coetur adipiscing \nelit ut aliquam, purus sit amet luctus Lorem \nipsum dolor sit amet aliquam, purus sit amet \nluctus ',
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
                      //! Rplay
                      svg: SvgManger.kReply,
                      title: 'Rplay',
                      titleColor: ColorManger.kBoulder,
                      borderColor: ColorManger.kBoulder,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
