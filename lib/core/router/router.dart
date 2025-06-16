import 'package:auto_route/auto_route.dart';
import '../../features/presentation/signup_page/view/create_an_account_page.dart';
import '../../features/presentation/login_page/view/login_email_confirm_otp_page.dart';
import '../../features/presentation/login_page/view/login_page.dart';
import '../../features/presentation/login_page/view/login_phone_confirm_otp_page.dart';
import '../../features/presentation/onboarding_page/view/onboarding_page.dart';
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
  ];
}
