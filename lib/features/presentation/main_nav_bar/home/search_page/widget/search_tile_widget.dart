import 'package:flutter/material.dart';
import 'package:invesier/features/data/models/get_user_profile_model.dart';

class SearchTileWidget extends StatelessWidget {
  final void Function()? onTap;
  final GetUserProfileModel getUserProfileModel;
  const SearchTileWidget({
    super.key,
    this.onTap,
    required this.getUserProfileModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(getUserProfileModel.avatarUrl),
      ),
      title: Text(
        getUserProfileModel.name,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        getUserProfileModel.email,
        style: TextStyle(color: Colors.grey),
      ),
      trailing: Container(child: const Text("Chase")),
    );
  }
}
