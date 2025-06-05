import 'package:auto_route/auto_route.dart';
import '../../features/create_an_account_page/presentation/view/create_an_account_page.dart';
import '../../features/login_page/presentation/view/login_email_confirm_otp_page.dart';
import '../../features/login_page/presentation/view/login_page.dart';
import '../../features/login_page/presentation/view/login_phone_confirm_otp_page.dart';
import '../../features/onboarding_page/presentation/view/onboarding_page.dart';
import '../../features/signup_page/presentation/view/signup_confirm_otp_page.dart';
import '../../features/signup_page/presentation/view/signup_page.dart';
import '../../features/welcome_page/presentation/view/welcome_page.dart';

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
  ];
}
