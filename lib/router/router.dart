import 'package:auto_route/auto_route.dart';
import 'package:invesier/features/create_an_account_page/presentation/view/create_an_account_page.dart';
import 'package:invesier/features/login_page/presentation/view/login_page.dart';
import 'package:invesier/features/onboarding_page/presentation/view/onboarding_page.dart';
import 'package:invesier/features/signup_page/presentation/view/signup_page.dart';
import 'package:invesier/features/welcome_page/presentation/view/welcome_page.dart';

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
  ];
}
