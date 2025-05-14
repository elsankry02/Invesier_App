import 'package:auto_route/auto_route.dart';
import 'package:invesier/view/login_page/login_page.dart';
import 'package:invesier/view/onboarding_page/onboarding_page.dart';
import 'package:invesier/view/signup_page/signup_page.dart';

part 'router.gr.dart';

final router = AppRouter();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OnboardingRoute.page, initial: true),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: SignupRoute.page),
  ];
}
