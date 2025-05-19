import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/components/custom_primary_button.dart';
import 'package:invesier/constant/color_manger.dart';
import 'package:invesier/constant/image_manger.dart';
import 'package:invesier/model/onboarding_model.dart';
import 'package:invesier/router/router.dart';
import 'package:invesier/features/onboarding_page/widget/generator_widget.dart';
import 'package:invesier/features/onboarding_page/widget/product_display_widget.dart';
import 'package:invesier/features/onboarding_page/widget/skip_widget.dart';

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
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          //! BackGroundImage
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(ImageManger.kLogIn),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: h * 0.032),
                //! Skip
                SkipWidget(
                  skip: 'Skip',
                  onTap: () {
                    context.router.replace(WelcomeRoute());
                  },
                ),
                Expanded(
                  //!PageView
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
                //! GenerateWidget
                GeneratorWidget(currentIndex: currentIndex),
                //
                SizedBox(height: h * 0.060),
                //! Conditional
                CustomPrimaryButton(
                  titel: 'Next',
                  gradient: LinearGradient(
                    colors: [
                      ColorManger.kEucalyptus,
                      ColorManger.kTurquoiseBlue,
                    ],
                  ),
                  onTap: () {
                    if (currentIndex == items(context).length - 1) {
                      context.router.push(WelcomeRoute());
                    }
                    pageController.animateToPage(
                      ++currentIndex,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeIn,
                    );
                  },
                  titelColor: ColorManger.kWhite,
                ),
                //
                SizedBox(height: h * 0.057),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
