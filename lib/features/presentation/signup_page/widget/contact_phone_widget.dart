import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/custom_text_form_field.dart';
import '../../../../core/constant/color_manger.dart';
import '../../../../core/extension/extension.dart';

class ContactPhoneWidget extends StatefulWidget {
  const ContactPhoneWidget({
    super.key,
    required this.phoneController,
    this.validator,
    this.autovalidateMode,
    this.onChanged,
  });
  final Function(String value)? onChanged;
  final AutovalidateMode? autovalidateMode;
  final TextEditingController phoneController;
  final String? Function(String? value)? validator;

  @override
  State<ContactPhoneWidget> createState() => _ContactPhoneWidgetState();
}

class _ContactPhoneWidgetState extends State<ContactPhoneWidget> {
  CountryCode? selectedCountry;
  final flCountryCodePicker = const FlCountryCodePicker(
    localize: true,
    showDialCode: true,
    showSearchBar: true,
    favorites: ['EG', 'SA', 'US'],
    title: Text(''),
    filteredCountries: ['EG', 'SA', 'US'],
    countryTextStyle: TextStyle(color: ColorManger.kBackGround),
    dialCodeTextStyle: TextStyle(color: ColorManger.kBackGround),
    searchBarTextStyle: TextStyle(color: ColorManger.kBackGround),
    searchBarDecoration: InputDecoration(
      focusedBorder: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(),
    ),
  );
  String countryCodeToEmoji(String countryCode) {
    final flag =
        countryCode
            .toUpperCase()
            .codeUnits
            .map((e) => String.fromCharCode(e + 127397))
            .join();
    return flag;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Phone number
        Text(
          'Phone number',
          style: context.kTextTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: context.height * 0.004),
        CustomTextFormField(
          onChanged: widget.onChanged,
          autovalidateMode: widget.autovalidateMode,
          title: '0109******',
          controller: widget.phoneController,
          validator: widget.validator,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
