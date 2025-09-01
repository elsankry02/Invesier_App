import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../provider/localization_provider.dart';

import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/constant/app_enums.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../provider/provider.dart';

class SettingLanguageDialog extends ConsumerWidget {
  const SettingLanguageDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final local = context.kAppLocalizations;
    final lang = ref.watch(languageProvider);
    return AlertDialog(
      backgroundColor: AppColors.kOne,
      title: Text(context.kAppLocalizations.applanguage),
      content: PopupMenuButton<Language>(
        offset: Offset(20, 20),
        onSelected: (value) async {
          final isSelected = ref
              .read(languageProvider.notifier)
              .update((state) => value);
          await ref.read(localizationProvider.notifier).changeLocale(value);
          context.router.maybePop();
          if (value == isSelected) return;
        },
        itemBuilder: (context) {
          return List.generate(Language.values.length, (index) {
            final value = Language.values[index];
            return PopupMenuItem(
              value: value,
              child: Center(child: Text(value.name)),
            );
          });
        },
        child: ListTile(
          title: Text(
            "${lang.name} ${lang.flag}",
            style: context.kTextTheme.titleSmall!.copyWith(
              color: AppColors.kWhite,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: AppColors.kWhite,
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => context.router.maybePop(),
          child: Text(
            local.close,
            style: context.kTextTheme.titleSmall!.copyWith(
              color: AppColors.kRedTwo,
            ),
          ),
        ),
      ],
    );
  }
}
