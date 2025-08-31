import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/constant/app_colors.dart';
import 'package:invesier/core/constant/app_enums.dart';
import 'package:invesier/core/extension/extension.dart';
import 'package:invesier/features/provider/provider.dart';

class SettingLanguageDialog extends ConsumerWidget {
  const SettingLanguageDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = ref.watch(languageProvider);
    return AlertDialog(
      backgroundColor: AppColors.kOne,
      title: Text(context.kAppLocalizations.applanguage),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.language),
          PopupMenuButton<Language>(
            offset: Offset(20, 20),
            onSelected: (value) {
              ref.read(languageProvider.notifier).update((state) => value);
              context.router.maybePop();
            },
            itemBuilder: (context) {
              return List.generate(Language.values.length, (index) {
                final value = Language.values[index];
                return PopupMenuItem(
                  value: value,
                  child: Row(
                    spacing: 5,
                    children: [Text(value.name), Text(value.flag)],
                  ),
                );
              });
            },
            child: Text("${lang.name} ${lang.flag}"),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => context.router.maybePop(),
          child: const Text("Close"),
        ),
      ],
    );
  }
}
