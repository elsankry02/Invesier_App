import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/constant/image_manger.dart';
import 'package:invesier/core/extension/extension.dart';
import 'package:invesier/features/presentation/home_page/widget/post_card_widget.dart';

@RoutePage()
class PersonalProfilePage extends StatelessWidget {
  const PersonalProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorManger.k1, ColorManger.k2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.router.maybePop();
                      },
                      //! Icon
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: ColorManger.kWhite,
                      ),
                    ),
                    ClipOval(
                      //! Image
                      child: Image.asset(
                        ImageManger.kBoyFour,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! title
                    Text(
                      'Alex Johnson',
                      style: context.kTextTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    //! subTitle
                    Text(
                      '@johnson_a',
                      style: context.kTextTheme.labelMedium!.copyWith(
                        color: ColorManger.kGray,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: context.height * 0.004),
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //! Posts
                    FollowingNumberWidget(title: 'Posts', number: '84'),
                    divider(context),
                    //! Fans
                    FollowingNumberWidget(title: 'Fans', number: '358'),
                    divider(context),
                    //! Pioneers
                    FollowingNumberWidget(title: 'Pioneers', number: '172'),
                  ],
                ),
              ),
            ),
            SizedBox(height: context.height * 0.021),
            //! My Posts
            Text(
              textAlign: TextAlign.center,
              'My Posts',
              style: context.kTextTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: context.height * 0.021),
            //! builder
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return PostCardWidget(onTap: () {});
              },
            ),
          ],
        ),
      ),
    );
  }

  Container divider(BuildContext context) {
    return Container(
      width: 1.5,
      height: context.height * 0.030,
      color: ColorManger.kWhite,
    );
  }
}

class FollowingNumberWidget extends StatelessWidget {
  const FollowingNumberWidget({
    super.key,
    required this.title,
    required this.number,
  });
  final String title;
  final String number;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          textAlign: TextAlign.center,
          number,
          style: context.kTextTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          title,
          style: context.kTextTheme.labelMedium!.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
