import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/constant/app_enums.dart';
import '../../../../../../../core/extension/extension.dart';
import '../../../../../../data/providers/localization_provider.dart';
import '../../../../../../data/providers/provider.dart';

class SettingChangeLanguage extends ConsumerStatefulWidget {
  const SettingChangeLanguage({super.key});

  @override
  ConsumerState<SettingChangeLanguage> createState() =>
      _SettingLanguageDialogState();
}

class _SettingLanguageDialogState extends ConsumerState<SettingChangeLanguage> {
  late String isSelected;
  getLang() {
    isSelected = ref.read(prefsProvider).getString("lang") ?? "en";
  }

  @override
  void initState() {
    getLang();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: context.height * 0.020),
      decoration: BoxDecoration(),
      width: context.width,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              internalAddSemanticForOnTap: false,
              onTap: () {
                ref
                    .read(localizationProvider.notifier)
                    .localiztation(Localization.english);
                setState(() {
                  isSelected = "en";
                });
              },
              leading: Icon(
                isSelected == "en"
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
              ),
              title: Text(
                "English",
                style: context.kTextTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                ref
                    .read(localizationProvider.notifier)
                    .localiztation(Localization.arabic);
                setState(() {
                  isSelected = "ar";
                });
              },
              leading: Icon(
                isSelected == "en"
                    ? Icons.radio_button_unchecked
                    : Icons.radio_button_checked,
              ),
              title: Text(
                "Arabic",
                style: context.kTextTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
