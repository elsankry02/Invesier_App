import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/presentation/bottom_navigationbar_page/view/bottom_navigation_bar_page.dart';
import '../../features/presentation/home/drawer_page/view/drawer_page.dart';
import '../../features/presentation/home/home_follow_page/view/home_follow_page.dart';
import '../../features/presentation/home/home_page/view/comment_page.dart';
import '../../features/presentation/home/home_page/view/post_page.dart';
import '../../features/presentation/home/notification_page/view/notification_page.dart';
import '../../features/presentation/home/personal_profile_page/view/personal_profile_page.dart';
import '../../features/presentation/home/search_page/view/search_page.dart';
import '../../features/presentation/home/user_profile_page/view/user_profile_page.dart';
import '../../features/presentation/login_page/view/login_page.dart';
import '../../features/presentation/onboarding_page/view/onboarding_page.dart';
import '../../features/presentation/signup_page/view/complete_profile_page.dart';
import '../../features/presentation/signup_page/view/signup_page.dart';
import '../../features/presentation/splash_page/view/splash_page.dart';
import '../../features/presentation/welcome_page/view/welcome_page.dart';
import '../components/custom_verify_otp_page.dart';
import '../constant/app_enums.dart';

part 'router.gr.dart';

final router = AppRouter();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: OnboardingRoute.page),
    AutoRoute(page: SignupRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: WelcomeRoute.page),
    AutoRoute(page: CreateAnAccountRoute.page),
    AutoRoute(page: CustomConfirmOtpRoute.page),
    AutoRoute(page: BottomNavigationBarRoute.page),
    AutoRoute(page: DrawerRoute.page),
    AutoRoute(page: CommentRoute.page),
    AutoRoute(page: PostRoute.page),
    AutoRoute(page: PersonalProfileRoute.page),
    AutoRoute(page: UserProfileRoute.page),
    AutoRoute(page: HomeFollowRoute.page),
    AutoRoute(page: NotificationRoute.page),
    AutoRoute(page: SearchRoute.page),
  ];
}
