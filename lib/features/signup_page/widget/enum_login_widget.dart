import 'package:flutter/material.dart';
import 'package:invesier/components/custom_button_style_enum.dart';
import 'package:invesier/constant/color_manger.dart';
import 'package:invesier/features/signup_page/widget/contact_email_widget.dart';
import 'package:invesier/features/signup_page/widget/contact_phone_widget.dart';

enum ContactType { email, phone }

class EnumLoginWidget extends StatefulWidget {
  const EnumLoginWidget({super.key});

  @override
  State<EnumLoginWidget> createState() => _EnumLoginWidgetState();
}

class _EnumLoginWidgetState extends State<EnumLoginWidget> {
  final pageController = PageController(initialPage: 1);
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  ContactType contactType = ContactType.phone;

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        children: [
          //! Contact Type
          enumContactType(),
          SizedBox(height: h * 0.047),
          //! PageView
          SizedBox(
            height: h * 0.150,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                //! Email Widget
                ContactEmailWidget(emailController: emailController),
                //! Phone Widget
                ContactPhoneWidget(phoneController: phoneController),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row enumContactType() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //! CustomButton Email
        CustomButtonStyleEnum(
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
        //! CustomButton Phone
        CustomButtonStyleEnum(
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
    );
  }
}
