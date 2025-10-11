import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/components/custom_circuler_progress.dart';
import '../../../../../../core/components/custom_no_posts_widget.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/router/router.dart';
import '../../../../../data/providers/get/get_user_fans_provider.dart';
import 'user_fans_tile_widget.dart';

class UserFansWidget extends ConsumerStatefulWidget {
  final String username;
  const UserFansWidget({super.key, required this.username});

  @override
  ConsumerState<UserFansWidget> createState() => _UserFansWidgetState();
}

class _UserFansWidgetState extends ConsumerState<UserFansWidget> {
  @override
  void initState() {
    ref
        .read(getUserFansProvider.notifier)
        .getUserFans(username: widget.username);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(getUserFansProvider);
    if (state is GetUserFansSuccess) {
      if (state.getUserFans.isEmpty) {
        return Text(
          context.kAppLocalizations.noFansFound,
          textAlign: TextAlign.center,
          style: context.kTextTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        );
      }
      return Expanded(
        child: ListView.builder(
          itemCount: state.getUserFans.length,
          itemBuilder: (context, index) {
            return UserFansTileWidget(
              onTap: () {
                final username =
                    state.getUserFans[index].username ??
                    context.kAppLocalizations.username;
                context.router.push(OtherUserProfileRoute(username: username));
              },
              getUserFansModel: state.getUserFans[index],
            );
          },
        ),
      );
    } else if (state is GetUserFansFailure) {
      return CustomNoPostsWidget(title: state.errMessage);
    } else if (state is GetUserFansLoading) {
      return CustomCircularProgressIndicator();
    }
    return SizedBox();
  }
}
