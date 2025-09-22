import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../data/providers/get/get_list_users_provider.dart';

import '../../../../../../core/components/custom_circuler_progress.dart';
import '../../../../../../core/components/custom_icon_button.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/router/router.dart';
import '../widget/search_text_form_field_widget.dart';
import '../widget/search_tile_widget.dart';

@RoutePage()
class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.kOne, AppColors.kTwo],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: context.height * 0.025),
            child: Column(
              children: [
                Row(
                  children: [
                    // Custom IconButton
                    CustomIconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.kWhite,
                      ),
                      onPressed: () {
                        context.router.maybePop();
                      },
                    ),
                    // HomeFollow TextFormField Widget
                    Expanded(
                      child: SearchTextFormFieldWidget(
                        searchController: searchController,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            ref
                                .read(getListUsersProvider.notifier)
                                .getListUsers(userName: value.trim());
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.height * 0.020),
                Consumer(
                  builder: (context, ref, child) {
                    final state = ref.watch(getListUsersProvider);
                    if (state is GetListUsersLoading) {
                      return CustomCircularProgressIndicator();
                    } else if (state is GetListUsersFailure) {
                      return Center(child: Text(state.errMessage));
                    } else if (state is GetListUsersSuccess) {
                      if (state.getlistUsers.isEmpty) {
                        return Center(
                          child: Text(context.kAppLocalizations.noresultsfound),
                        );
                      }
                      return Expanded(
                        child: ListView.builder(
                          itemCount: state.getlistUsers.length,
                          itemBuilder: (context, index) {
                            return SearchTileWidget(
                              onTap: () {
                                context.router.push(
                                  UserProfileRoute(
                                    username:
                                        state.getlistUsers[index].username,
                                  ),
                                );
                              },
                              getListUsers: state.getlistUsers[index],
                            );
                          },
                        ),
                      );
                    }
                    return SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
