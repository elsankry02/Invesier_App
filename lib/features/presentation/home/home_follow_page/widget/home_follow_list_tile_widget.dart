import 'package:flutter/material.dart';
import 'package:invesier/features/model/home_follow_model.dart';

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
        child: Image.asset(
          items.image,
          height: 30,
          width: 30,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(items.title),
      subtitle: Text(items.subTitle),
      trailing: Container(
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(31),
          border: Border.all(color: broderColor),
        ),
        child: Text(title),
      ),
    );
  }
}
