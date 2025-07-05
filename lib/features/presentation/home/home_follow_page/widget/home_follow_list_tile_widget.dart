import 'package:flutter/material.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../model/home_follow_model.dart';

class HomeFollowListTileWidget extends StatelessWidget {
  const HomeFollowListTileWidget({
    super.key,
    required this.items,
    required this.broderColor,
    required this.title,
  });

  final HomeFollowModel items;
  final Color broderColor;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: ClipOval(
        // image
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
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(31),
          border: Border.all(color: broderColor),
        ),
        child: Text(
          title,
          style: context.kTextTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
