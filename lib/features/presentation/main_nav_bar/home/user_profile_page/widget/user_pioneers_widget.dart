import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/components/custom_no_posts_widget.dart';
import 'package:invesier/core/extension/extension.dart';

import '../../../../../../core/components/custom_circuler_progress.dart';
import '../../../../../../core/router/router.dart';
import '../../../../../data/providers/get/get_user_pioneers_provider.dart';
import '../../../../../data/providers/get/get_user_profile_provider.dart';
import 'user_pioneers_tile_widget.dart';

class UserPioneersWidget extends ConsumerWidget {
  const UserPioneersWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pioneersState = ref.watch(getUserPioneersProvider);
    final profileState = ref.watch(getUserProfileProvider);
    if (pioneersState is GetUserPioneersLoading) {
      return CustomCircularProgressIndicator();
    } else if (pioneersState is GetUserPioneersFailure) {
      return Center(child: Text(pioneersState.errMessage));
    } else if (pioneersState is GetUserPioneersSuccess &&
        profileState is GetUserProfileSuccess) {
      if (pioneersState.getUserPioneersModel.isEmpty) {
        return CustomNoPostsWidget(
          title: context.kAppLocalizations.nopioneersfound,
        );
      }
      return ListView.builder(
        itemCount: pioneersState.getUserPioneersModel.length,
        itemBuilder: (context, index) {
          return UserPioneersTileWidget(
            onTap:
                () => context.router.push(
                  UserProfileRoute(
                    getUserProfileModel: profileState.getUserProfileModel,
                  ),
                ),
            getUserPioneersModel: pioneersState.getUserPioneersModel[index],
          );
        },
      );
    }
    return SizedBox();
  }
}
