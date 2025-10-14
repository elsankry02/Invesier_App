import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/constant/app_text_theme.dart';

import '../../../../../../core/components/custom_circuler_progress.dart';
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
    ref
        .read(getUserPioneersProvider.notifier)
        .getUserPioneers(username: widget.username);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(getUserPioneersProvider);
    if (state is GetUserPioneersLoading) {
      return CustomCircularProgressIndicator();
    } else if (state is GetUserPioneersFailure) {
      return Text(
        state.errMessage,
        textAlign: TextAlign.center,
        style: AppTextTheme.kTitleMedium(context, fontWeight: FontWeight.w700),
      );
    } else if (state is GetUserPioneersSuccess) {
      if (state.getUserPioneers.isEmpty) {
        return Text(
          context.kAppLocalizations.nopioneersfound,
          textAlign: TextAlign.center,
          style: AppTextTheme.kTitleMedium(
            context,
            fontWeight: FontWeight.w700,
          ),
        );
      }
      return Expanded(
        child: ListView.builder(
          itemCount: state.getUserPioneers.length,
          itemBuilder: (context, index) {
            final pioneers = state.getUserPioneers[index];
            return UserPioneersTileWidget(
              onTap: () {
                final username =
                    pioneers.username ?? context.kAppLocalizations.username;
                context.router.push(OtherUserProfileRoute(username: username));
              },
              getUserPioneersModel: pioneers,
            );
          },
        ),
      );
    }

    return SizedBox();
  }
}
