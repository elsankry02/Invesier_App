import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/components/custom_primary_button.dart';
import '../../../../core/constant/color_manger.dart';
import '../../../../core/constant/image_manger.dart';
import '../../../../core/constant/strings.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/router/router.dart';
import '../../../model/onboarding_model.dart';
import '../../../provider/provider.dart';
import '../widget/generator_widget.dart';
import '../widget/product_display_widget.dart';
import '../widget/skip_widget.dart';

@RoutePage()
class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
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
          // BackGroundImage
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(ImageManger.kOnBoarding),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: context.height * 0.020),
                // Skip
                SkipWidget(
                  skip: 'Skip',
                  onTap: () {
                    context.router.replace(WelcomeRoute());
                  },
                ),
                Expanded(
                  //PageView
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
                //
                SizedBox(height: context.height * 0.060),
                // Custom Primary Button (Next)
                CustomPrimaryButton(
                  title: 'Next',
                  gradient: LinearGradient(
                    colors: [
                      ColorManger.kEucalyptus,
                      ColorManger.kTurquoiseBlue,
                    ],
                  ),
                  borderColor: ColorManger.kTurquoiseBlue,
                  padding: EdgeInsetsDirectional.symmetric(vertical: 13),
                  radius: 60,
                  style: context.kTextTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorManger.kWhite,
                  ),
                  onTap: () async {
                    if (currentIndex == items(context).length - 1) {
                      await ref
                          .read(prefsProvider)
                          .setBool(CustomStrings.skipOnboarding, true);
                      context.router.push(WelcomeRoute());
                    }
                    pageController.animateToPage(
                      ++currentIndex,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                ),
                //
                SizedBox(height: context.height * 0.057),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
