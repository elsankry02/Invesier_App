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
  final pageController = PageController(initialPage: 0);
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    pageController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final kTextTheme = Theme.of(context).textTheme;
    final h = MediaQuery.of(context).size.height;
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
          SizedBox(
            height: h * 0.150,
            //! PageView
            child: PageView(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {});
              },
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! Email
                    Text(
                      'Email',
                      style: kTextTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: h * 0.004),
                    CustomTextFormField(
                      title: 'name@gmail.com',
                      controller: emailController,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! Phone
                    Text(
                      'Phone number',
                      style: kTextTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: h * 0.004),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: ColorManger.kBorder),
                          ),
                          child: Center(
                            //! TextCountry
                            child: Text(
                              '🇪🇬 +20',
                              style: kTextTheme.labelLarge!.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        //! CustomTextFormField
                        CustomTextFormField(
                          title: '0109******',
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
