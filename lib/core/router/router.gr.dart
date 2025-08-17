// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [CommentPage]
class CommentRoute extends PageRouteInfo<void> {
  const CommentRoute({List<PageRouteInfo>? children})
    : super(CommentRoute.name, initialChildren: children);

  static const String name = 'CommentRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CommentPage();
    },
  );
}

/// generated route for
/// [CompleteProfilePage]
class CompleteProfileRoute extends PageRouteInfo<void> {
  const CompleteProfileRoute({List<PageRouteInfo>? children})
    : super(CompleteProfileRoute.name, initialChildren: children);

  static const String name = 'CompleteProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CompleteProfilePage();
    },
  );
}

/// generated route for
/// [CustomVerifyOtpPage]
class CustomVerifyOtpRoute extends PageRouteInfo<CustomVerifyOtpRouteArgs> {
  CustomVerifyOtpRoute({
    required TextEditingController phoneController,
    required TextEditingController emailController,
    required ContactType contactType,
    required bool isLogin,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         CustomVerifyOtpRoute.name,
         args: CustomVerifyOtpRouteArgs(
           phoneController: phoneController,
           emailController: emailController,
           contactType: contactType,
           isLogin: isLogin,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'CustomVerifyOtpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CustomVerifyOtpRouteArgs>();
      return CustomVerifyOtpPage(
        args.phoneController,
        args.emailController,
        args.contactType,
        isLogin: args.isLogin,
        key: args.key,
      );
    },
  );
}

class CustomVerifyOtpRouteArgs {
  const CustomVerifyOtpRouteArgs({
    required this.phoneController,
    required this.emailController,
    required this.contactType,
    required this.isLogin,
    this.key,
  });

  final TextEditingController phoneController;

  final TextEditingController emailController;

  final ContactType contactType;

  final bool isLogin;

  final Key? key;

  @override
  String toString() {
    return 'CustomVerifyOtpRouteArgs{phoneController: $phoneController, emailController: $emailController, contactType: $contactType, isLogin: $isLogin, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CustomVerifyOtpRouteArgs) return false;
    return phoneController == other.phoneController &&
        emailController == other.emailController &&
        contactType == other.contactType &&
        isLogin == other.isLogin &&
        key == other.key;
  }

  @override
  int get hashCode =>
      phoneController.hashCode ^
      emailController.hashCode ^
      contactType.hashCode ^
      isLogin.hashCode ^
      key.hashCode;
}

/// generated route for
/// [DrawerPage]
class DrawerRoute extends PageRouteInfo<void> {
  const DrawerRoute({List<PageRouteInfo>? children})
    : super(DrawerRoute.name, initialChildren: children);

  static const String name = 'DrawerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DrawerPage();
    },
  );
}

/// generated route for
/// [HomeFollowPage]
class HomeFollowRoute extends PageRouteInfo<HomeFollowRouteArgs> {
  HomeFollowRoute({
    Key? key,
    required FollowTabType initialTab,
    List<PageRouteInfo>? children,
  }) : super(
         HomeFollowRoute.name,
         args: HomeFollowRouteArgs(key: key, initialTab: initialTab),
         initialChildren: children,
       );

  static const String name = 'HomeFollowRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeFollowRouteArgs>();
      return HomeFollowPage(key: args.key, initialTab: args.initialTab);
    },
  );
}

class HomeFollowRouteArgs {
  const HomeFollowRouteArgs({this.key, required this.initialTab});

  final Key? key;

  final FollowTabType initialTab;

  @override
  String toString() {
    return 'HomeFollowRouteArgs{key: $key, initialTab: $initialTab}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HomeFollowRouteArgs) return false;
    return key == other.key && initialTab == other.initialTab;
  }

  @override
  int get hashCode => key.hashCode ^ initialTab.hashCode;
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginPage();
    },
  );
}

/// generated route for
/// [MainNavigationPage]
class MainNavigationRoute extends PageRouteInfo<MainNavigationRouteArgs> {
  MainNavigationRoute({Key? key, Widget? drawer, List<PageRouteInfo>? children})
    : super(
        MainNavigationRoute.name,
        args: MainNavigationRouteArgs(key: key, drawer: drawer),
        initialChildren: children,
      );

  static const String name = 'MainNavigationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MainNavigationRouteArgs>(
        orElse: () => const MainNavigationRouteArgs(),
      );
      return MainNavigationPage(key: args.key, drawer: args.drawer);
    },
  );
}

class MainNavigationRouteArgs {
  const MainNavigationRouteArgs({this.key, this.drawer});

  final Key? key;

  final Widget? drawer;

  @override
  String toString() {
    return 'MainNavigationRouteArgs{key: $key, drawer: $drawer}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MainNavigationRouteArgs) return false;
    return key == other.key && drawer == other.drawer;
  }

  @override
  int get hashCode => key.hashCode ^ drawer.hashCode;
}

/// generated route for
/// [NotificationPage]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
    : super(NotificationRoute.name, initialChildren: children);

  static const String name = 'NotificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NotificationPage();
    },
  );
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardingPage();
    },
  );
}

/// generated route for
/// [PersonalProfilePage]
class PersonalProfileRoute extends PageRouteInfo<void> {
  const PersonalProfileRoute({List<PageRouteInfo>? children})
    : super(PersonalProfileRoute.name, initialChildren: children);

  static const String name = 'PersonalProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PersonalProfilePage();
    },
  );
}

/// generated route for
/// [PostPage]
class PostRoute extends PageRouteInfo<void> {
  const PostRoute({List<PageRouteInfo>? children})
    : super(PostRoute.name, initialChildren: children);

  static const String name = 'PostRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PostPage();
    },
  );
}

/// generated route for
/// [RecentTransactionsPage]
class RecentTransactionsRoute extends PageRouteInfo<void> {
  const RecentTransactionsRoute({List<PageRouteInfo>? children})
    : super(RecentTransactionsRoute.name, initialChildren: children);

  static const String name = 'RecentTransactionsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RecentTransactionsPage();
    },
  );
}

/// generated route for
/// [RejectedPage]
class RejectedRoute extends PageRouteInfo<void> {
  const RejectedRoute({List<PageRouteInfo>? children})
    : super(RejectedRoute.name, initialChildren: children);

  static const String name = 'RejectedRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RejectedPage();
    },
  );
}

/// generated route for
/// [SearchPage]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchPage();
    },
  );
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsPage();
    },
  );
}

/// generated route for
/// [SignupPage]
class SignupRoute extends PageRouteInfo<void> {
  const SignupRoute({List<PageRouteInfo>? children})
    : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignupPage();
    },
  );
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashPage();
    },
  );
}

/// generated route for
/// [TransactionsHistoryPage]
class TransactionsHistoryRoute extends PageRouteInfo<void> {
  const TransactionsHistoryRoute({List<PageRouteInfo>? children})
    : super(TransactionsHistoryRoute.name, initialChildren: children);

  static const String name = 'TransactionsHistoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TransactionsHistoryPage();
    },
  );
}

/// generated route for
/// [UnderReveiwPage]
class UnderReveiwRoute extends PageRouteInfo<void> {
  const UnderReveiwRoute({List<PageRouteInfo>? children})
    : super(UnderReveiwRoute.name, initialChildren: children);

  static const String name = 'UnderReveiwRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UnderReveiwPage();
    },
  );
}

/// generated route for
/// [UserProfilePage]
class UserProfileRoute extends PageRouteInfo<void> {
  const UserProfileRoute({List<PageRouteInfo>? children})
    : super(UserProfileRoute.name, initialChildren: children);

  static const String name = 'UserProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UserProfilePage();
    },
  );
}

/// generated route for
/// [VerificationRequestPage]
class VerificationRequestRoute extends PageRouteInfo<void> {
  const VerificationRequestRoute({List<PageRouteInfo>? children})
    : super(VerificationRequestRoute.name, initialChildren: children);

  static const String name = 'VerificationRequestRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const VerificationRequestPage();
    },
  );
}

/// generated route for
/// [WalletPage]
class WalletRoute extends PageRouteInfo<void> {
  const WalletRoute({List<PageRouteInfo>? children})
    : super(WalletRoute.name, initialChildren: children);

  static const String name = 'WalletRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WalletPage();
    },
  );
}

/// generated route for
/// [WelcomePage]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
    : super(WelcomeRoute.name, initialChildren: children);

  static const String name = 'WelcomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WelcomePage();
    },
  );
}

/// generated route for
/// [YouAreVerifiedPage]
class YouAreVerifiedRoute extends PageRouteInfo<void> {
  const YouAreVerifiedRoute({List<PageRouteInfo>? children})
    : super(YouAreVerifiedRoute.name, initialChildren: children);

  static const String name = 'YouAreVerifiedRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const YouAreVerifiedPage();
    },
  );
}
