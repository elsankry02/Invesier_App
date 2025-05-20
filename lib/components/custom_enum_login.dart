import 'package:flutter/material.dart';
import 'package:invesier/components/custom_button_enum.dart';
import 'package:invesier/components/custom_text_field.dart';
import 'package:invesier/constant/color_manger.dart';

enum IsSelected { email, phone }

class CustomEnumLogin extends StatefulWidget {
  const CustomEnumLogin({super.key});

  @override
  State<CustomEnumLogin> createState() => _CustomEnumLoginState();
}

class _CustomEnumLoginState extends State<CustomEnumLogin> {
  IsSelected isSelected = IsSelected.phone;

  @override
  Widget build(BuildContext context) {
    final kTextTheme = Theme.of(context).textTheme;
    final h = MediaQuery.of(context).size.height;
    // final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //! Email
              CustomButtonEnum(
                title: 'Email',
                topLeft: 26,
                bottomLeft: 26,
                titleColor:
                    isSelected == IsSelected.email
                        ? ColorManger.kWhite
                        : ColorManger.kTurquoiseBlue,
                color:
                    isSelected == IsSelected.email
                        ? ColorManger.kTurquoiseBlue
                        : ColorManger.kCodGray,
                onTap: () {
                  setState(() {
                    isSelected = IsSelected.email;
                  });
                },
              ),
              //! Phone
              CustomButtonEnum(
                title: 'Phone',
                topRight: 26,
                bottomRight: 26,
                titleColor:
                    isSelected == IsSelected.phone
                        ? ColorManger.kWhite
                        : ColorManger.kTurquoiseBlue,
                color:
                    isSelected == IsSelected.phone
                        ? ColorManger.kTurquoiseBlue
                        : ColorManger.kCodGray,
                onTap: () {
                  setState(() {
                    isSelected = IsSelected.phone;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: h * 0.047),
          Align(
            alignment: Alignment.centerLeft,
            //! Phone number
            child: Text(
              'Phone number',
              style: kTextTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w600,
                // color: ColorManger.kWhite,
              ),
            ),
          ),
          SizedBox(height: h * 0.004),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: ColorManger.kWhite),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('🇪🇬'),
                    Text(
                      ' +20',
                      style: kTextTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              CustomTextFormField(),
            ],
          ),
        ],
      ),
    );
  }
}
