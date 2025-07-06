import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/features/presentation/home/notification_page/view/notification_page.dart';

import '../../features/presentation/bottom_navigationbar_page/view/bottom_navigation_bar_page.dart';
import '../../features/presentation/home/home_follow_page/view/home_follow_page.dart';
import '../../features/presentation/home/home_page/view/comment_page.dart';
import '../../features/presentation/home/home_page/view/post_page.dart';
import '../../features/presentation/home/personal_profile_page/view/personal_profile_page.dart';
import '../../features/presentation/home/side_menu_page/view/side_menu_page.dart';
import '../../features/presentation/home/user_profile_page/view/user_profile_page.dart';
import '../../features/presentation/login_page/view/login_email_confirm_otp_page.dart';
import '../../features/presentation/login_page/view/login_page.dart';
import '../../features/presentation/login_page/view/login_phone_confirm_otp_page.dart';
import '../../features/presentation/onboarding_page/view/onboarding_page.dart';
import '../../features/presentation/signup_page/view/create_an_account_page.dart';
import '../../features/presentation/signup_page/view/signup_confirm_otp_page.dart';
import '../../features/presentation/signup_page/view/signup_page.dart';
import '../../features/presentation/welcome_page/view/welcome_page.dart';

part 'router.gr.dart';

final router = AppRouter();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OnboardingRoute.page, initial: true),
    AutoRoute(page: SignupRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: WelcomeRoute.page),
    AutoRoute(page: CreateAnAccountRoute.page),
    AutoRoute(page: LoginEmailConfirmOtpRoute.page),
    AutoRoute(page: LoginPhoneConfirmOtpRoute.page),
    AutoRoute(page: SignUpConfirmOtpRoute.page),
    AutoRoute(page: BottomNavigationBarRoute.page),
    AutoRoute(page: SideMenuRoute.page),
    AutoRoute(page: CommentRoute.page),
    AutoRoute(page: PostRoute.page),
    AutoRoute(page: PersonalProfileRoute.page),
    AutoRoute(page: UserProfileRoute.page),
    AutoRoute(page: HomeFollowRoute.page),
    AutoRoute(page: NotificationRoute.page),
  ];
}
