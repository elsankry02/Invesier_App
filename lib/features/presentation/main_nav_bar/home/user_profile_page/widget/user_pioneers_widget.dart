import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/components/custom_circuler_progress.dart';
import 'package:invesier/core/components/custom_no_posts_widget.dart';
import 'package:invesier/core/extension/extension.dart';
import 'package:invesier/core/router/router.dart';
import 'package:invesier/features/data/providers/get/get_user_pioneers_provider.dart';
import 'package:invesier/features/presentation/main_nav_bar/home/user_profile_page/widget/user_pioneers_tile_widget.dart';

class UserPioneersWidget extends ConsumerStatefulWidget {
  final String username;
  const UserPioneersWidget({super.key, required this.username});

  @override
  ConsumerState<UserPioneersWidget> createState() => _UserPioneersWidgetState();
}

class _UserPioneersWidgetState extends ConsumerState<UserPioneersWidget> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(getUserPioneersProvider);
    if (state is GetUserPioneersLoading) {
      return CustomCircularProgressIndicator();
    } else if (state is GetUserPioneersFailure) {
      return Center(child: Text(state.errMessage));
    } else if (state is GetUserPioneersSuccess) {
      if (state.getUserPioneers.isEmpty) {
        return CustomNoPostsWidget(
          title: context.kAppLocalizations.nopioneersfound,
        );
      }

      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: state.getUserPioneers.length,
        itemBuilder: (context, index) {
          final pioneers = state.getUserPioneers[index];
          return UserPioneersTileWidget(
            onTap:
                () => context.router.push(
                  UserProfileRoute(userName: pioneers.username),
                ),
            getUserPioneersModel: pioneers,
          );
        },
      );
    }

    return SizedBox();
  }
}
