import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/components/custom_primary_button.dart';
import 'package:invesier/constant/color_manger.dart';
import 'package:invesier/constant/image_manger.dart';
import 'package:invesier/model/onboarding_model.dart';
import 'package:invesier/router/router.dart';
import 'package:invesier/view/onboarding_page/widget/generate_widget.dart';
import 'package:invesier/view/onboarding_page/widget/items_page_widget.dart';
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
              SkipWidget(onTap: () {}),
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
                    return ItemsPageWidget(item: item);
                  },
                ),
              ),
              // GenerateWidget
              GenerateWidget(currentIndex: currentIndex),
              SizedBox(height: 60),
              // CustomPrimaryButton
              CustomPrimaryButton(
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
                textColor: ColorManger.kWhite,
              ),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
