import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/components/custom_primary_button.dart';
import 'package:invesier/components/custom_rich_text.dart';
import 'package:invesier/constant/color_manger.dart';
import 'package:invesier/constant/image_manger.dart';
import 'package:invesier/model/onboarding_model.dart';
import 'package:invesier/router/router.dart';
import 'package:invesier/view/onboarding_page/widget/generator_widget.dart';
import 'package:invesier/view/onboarding_page/widget/product_display_widget.dart';
import 'package:invesier/view/onboarding_page/widget/skip_widget.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(ImageManger.kLogIn),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 60),
              // Skip
              SkipWidget(
                skip: currentIndex == 3 ? '' : 'Skip',
                onTap: () {
                  context.router.push(LoginRoute());
                },
              ),
              Expanded(
                // PageView
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemCount: items(context).length,
                  itemBuilder: (context, index) {
                    final item = items(context)[index];
                    return ProductDisplayWidget(item: item);
                  },
                ),
              ),
              // GenerateWidget
              GeneratorWidget(currentIndex: currentIndex),
              SizedBox(height: 60),
              // Conditional
              currentIndex != 3
                  ? CustomPrimaryButton(
                    titel: 'Next',
                    gradient: LinearGradient(
                      colors: [
                        ColorManger.kEucalyptus,
                        ColorManger.kTurquoiseBlue,
                      ],
                    ),
                    onTap: () {
                      if (currentIndex == items(context).length - 1) {
                        context.router.push(LoginRoute());
                      }
                      pageController.animateToPage(
                        ++currentIndex,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeIn,
                      );
                    },
                    titelColor: ColorManger.kWhite,
                  )
                  : Column(
                    children: [
                      // Get Started
                      CustomPrimaryButton(
                        onTap: () {
                          context.router.push(LoginRoute());
                        },
                        titel: 'Get Started',
                        titelColor: ColorManger.kWhite,
                        gradient: LinearGradient(
                          colors: [
                            ColorManger.kEucalyptus,
                            ColorManger.kTurquoiseBlue,
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                      // Login
                      CustomPrimaryButton(
                        onTap: () {
                          context.router.push(LoginRoute());
                        },
                        titel: 'Login',
                        border: Border.all(
                          width: 2,
                          color: ColorManger.kEucalyptus,
                        ),
                        titelColor: ColorManger.kEucalyptus,
                      ),
                      SizedBox(height: 12),
                      // RichTextWidget
                      CustomRichText(
                        onTap: () {
                          context.router.push(SignupRoute());
                        },
                        textSpanOne: 'Dont have an account?',
                        textSpanTwo: ' Sign up',
                        colorSpanOne: ColorManger.kBoulder,
                        colorSpanTwo: ColorManger.kWhite,
                      ),
                    ],
                  ),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
