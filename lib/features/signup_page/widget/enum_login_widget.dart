import 'package:flutter/material.dart';
import 'package:invesier/components/custom_button_enum.dart';
import 'package:invesier/components/custom_text_field.dart';
import 'package:invesier/constant/color_manger.dart';

enum ContactType { email, phone }

class EnumLoginWidget extends StatefulWidget {
  const EnumLoginWidget({super.key});

  @override
  State<EnumLoginWidget> createState() => _EnumLoginWidgetState();
}

class _EnumLoginWidgetState extends State<EnumLoginWidget> {
  ContactType contactType = ContactType.phone;
  final pageController = PageController(initialPage: 1);
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
                    contactType == ContactType.email
                        ? ColorManger.kWhite
                        : ColorManger.kTurquoiseBlue,
                color:
                    contactType == ContactType.email
                        ? ColorManger.kTurquoiseBlue
                        : ColorManger.kCodGray,
                onTap: () {
                  setState(() {
                    contactType = ContactType.email;
                    pageController.animateToPage(
                      0,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  });
                },
              ),
              //! Phone
              CustomButtonEnum(
                title: 'Phone',
                topRight: 26,
                bottomRight: 26,
                titleColor:
                    contactType == ContactType.phone
                        ? ColorManger.kWhite
                        : ColorManger.kTurquoiseBlue,
                color:
                    contactType == ContactType.phone
                        ? ColorManger.kTurquoiseBlue
                        : ColorManger.kCodGray,
                onTap: () {
                  setState(() {
                    contactType = ContactType.phone;
                    pageController.animateToPage(
                      1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
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
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,

              children: [
                //! Email
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                //! Phone
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                        //! Custom TextForm Field
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
