import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/components/custom_circuler_progress.dart';
import '../../../../../../core/components/custom_no_posts_widget.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/router/router.dart';
import '../../../../../data/providers/get/get_user_pioneers_provider.dart';
import 'user_pioneers_tile_widget.dart';

class UserPioneersWidget extends ConsumerStatefulWidget {
  final String username;
  const UserPioneersWidget({super.key, required this.username});

  @override
  ConsumerState<UserPioneersWidget> createState() => _UserPioneersWidgetState();
}

class _UserPioneersWidgetState extends ConsumerState<UserPioneersWidget> {
  @override
  void initState() {
    Future.microtask(() {
      ref
          .read(getUserPioneersProvider.notifier)
          .getUserPioneers(username: widget.username);
    });
    super.initState();
  }

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

      return Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: state.getUserPioneers.length,
          itemBuilder: (context, index) {
            final pioneers = state.getUserPioneers[index];
            return UserPioneersTileWidget(
              onTap:
                  () => context.router.push(
                    UserProfileRoute(
                      username:
                          pioneers.username ??
                          context.kAppLocalizations.username,
                    ),
                  ),
              getUserPioneersModel: pioneers,
            );
          },
        ),
      );
    }

    return SizedBox();
  }
}
