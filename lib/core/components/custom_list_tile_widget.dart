import 'package:flutter/material.dart';

import '../../features/model/home_follow_model.dart';
import '../extension/extension.dart';

class CustomListTileWidget extends StatelessWidget {
  const CustomListTileWidget({
    super.key,
    required this.items,
    required this.broderColor,
    required this.title,
    required this.horizontal,
    required this.vertical,
    this.backGroundColor,
  });

  final HomeFollowModel items;
  final Color? backGroundColor;
  final Color broderColor;
  final String title;
  final double horizontal, vertical;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      // image
      leading: ClipOval(
        child: Image.asset(
          items.image,
          height: 30,
          width: 30,
          fit: BoxFit.cover,
        ),
      ),
      // title
      title: Text(
        items.title,
        style: context.kTextTheme.titleSmall!.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      // subTitle
      subtitle: Text(
        items.subTitle,
        style: context.kTextTheme.titleSmall!.copyWith(
          fontWeight: FontWeight.w400,
        ),
      ),
      // trailing
      trailing: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(31),
          color: backGroundColor,
          border: Border.all(color: broderColor),
        ),
        child: Text(
          title,
          style: context.kTextTheme.labelMedium!.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
