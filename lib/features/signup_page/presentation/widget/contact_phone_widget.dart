import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/extension/extension.dart';

import '../../../../core/components/custom_text_form_field.dart';

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
  final countryPickerWithParams = const FlCountryCodePicker(
    localize: true,
    showDialCode: true,
    showSearchBar: true,
    favorites: ['EG', 'SA', 'US'],
    title: Text('AR'),
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
    return countryCode
        .toUpperCase()
        .codeUnits
        .map((e) => String.fromCharCode(e + 127397))
        .join();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        //! Phone number
        Text(
          'Phone number',
          style: context.kTextTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: context.height * 0.004),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () async {
                final code = await countryPickerWithParams.showPicker(
                  context: context,
                );
                if (code != null) {
                  setState(() {
                    selectedCountry = code;
                  });
                }
                return;
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: context.height * 0.012,
                  vertical: context.height * 0.017,
                ),

                decoration: BoxDecoration(
                  border: Border.all(color: ColorManger.kBorder),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    Text(countryCodeToEmoji(selectedCountry?.code ?? 'EG')),
                    SizedBox(width: 8),
                    Text(selectedCountry?.dialCode ?? '+20'),
                  ],
                ),
              ),
            ),
            SizedBox(width: 5),
            //! TextFormField Phone
            Expanded(
              child: CustomTextFormField(
                onChanged: widget.onChanged,
                autovalidateMode: widget.autovalidateMode,
                title: '0109******',
                controller: widget.phoneController,
                validator: widget.validator,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
