import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../features/data/model/get_posts_model.dart';
import '../../features/presentation/home/setting/personal_details_page/view/personal_details_page.dart';
import '../../features/presentation/home/setting/rejected_page/view/rejected_page.dart';
import '../../features/presentation/home/setting/under_reveiw_page/view/under_reveiw_page.dart';
import '../../features/presentation/home/setting/verification_request_page/view/verification_request_page.dart';
import '../../features/presentation/home/setting/you_are_verified_page/view/you_are_verified_page.dart';

import '../../features/presentation/complete_profile_page/view/complete_profile_page.dart';
import '../../features/presentation/home/comment_page/view/comment_page.dart';
import '../../features/presentation/home/drawer_page/view/drawer_page.dart';
import '../../features/presentation/home/home_follow_page/view/home_follow_page.dart';
import '../../features/presentation/home/notification_page/notification_page.dart';
import '../../features/presentation/home/personal_profile_page/view/personal_profile_page.dart';
import '../../features/presentation/home/post_page/view/post_page.dart';
import '../../features/presentation/home/recent_transactions_page/recent_transactions_page.dart';
import '../../features/presentation/home/search_page/view/search_page.dart';
import '../../features/presentation/home/setting/settings_page/view/settings_page.dart';
import '../../features/presentation/home/transactions_history_page/transactions_history_page.dart';
import '../../features/presentation/home/user_profile_page/view/user_profile_page.dart';
import '../../features/presentation/home/wallet_page/view/wallet_page.dart';
import '../../features/presentation/login_page/login_page.dart';
import '../../features/presentation/main_navigation_page/view/main_navigation_page.dart';
import '../../features/presentation/onboarding_page/view/onboarding_page.dart';
import '../../features/presentation/signup_page/view/signup_page.dart';
import '../../features/presentation/splash_page/splash_page.dart';
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
    AutoRoute(page: CompleteProfileRoute.page),
    AutoRoute(page: CustomVerifyOtpRoute.page),
    AutoRoute(page: MainNavigationRoute.page),
    AutoRoute(page: DrawerRoute.page),
    AutoRoute(page: CommentRoute.page),
    AutoRoute(page: PostRoute.page),
    AutoRoute(page: WalletRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: PersonalProfileRoute.page),
    AutoRoute(page: PersonalDetailsRoute.page),
    AutoRoute(page: TransactionsHistoryRoute.page),
    AutoRoute(page: RecentTransactionsRoute.page),
    AutoRoute(page: UserProfileRoute.page),
    AutoRoute(page: HomeFollowRoute.page),
    AutoRoute(page: NotificationRoute.page),
    AutoRoute(page: SearchRoute.page),
    AutoRoute(page: RejectedRoute.page),
    AutoRoute(page: UnderReveiwRoute.page),
    AutoRoute(page: VerificationRequestRoute.page),
    AutoRoute(page: YouAreVerifiedRoute.page),
  ];
}
