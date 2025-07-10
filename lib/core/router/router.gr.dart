// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [BottomNavigationBarPage]
class BottomNavigationBarRoute extends PageRouteInfo<void> {
  const BottomNavigationBarRoute({List<PageRouteInfo>? children})
    : super(BottomNavigationBarRoute.name, initialChildren: children);

  static const String name = 'BottomNavigationBarRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BottomNavigationBarPage();
    },
  );
}

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
/// [CreateAnAccountPage]
class CreateAnAccountRoute extends PageRouteInfo<void> {
  const CreateAnAccountRoute({List<PageRouteInfo>? children})
    : super(CreateAnAccountRoute.name, initialChildren: children);

  static const String name = 'CreateAnAccountRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CreateAnAccountPage();
    },
  );
}

/// generated route for
/// [HomeFollowPage]
class HomeFollowRoute extends PageRouteInfo<HomeFollowRouteArgs> {
  HomeFollowRoute({
    Key? key,
    required HomeFollowEnum initialTab,
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

  final HomeFollowEnum initialTab;

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
/// [LoginEmailConfirmOtpPage]
class LoginEmailConfirmOtpRoute extends PageRouteInfo<void> {
  const LoginEmailConfirmOtpRoute({List<PageRouteInfo>? children})
    : super(LoginEmailConfirmOtpRoute.name, initialChildren: children);

  static const String name = 'LoginEmailConfirmOtpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginEmailConfirmOtpPage();
    },
  );
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
/// [LoginPhoneConfirmOtpPage]
class LoginPhoneConfirmOtpRoute extends PageRouteInfo<void> {
  const LoginPhoneConfirmOtpRoute({List<PageRouteInfo>? children})
    : super(LoginPhoneConfirmOtpRoute.name, initialChildren: children);

  static const String name = 'LoginPhoneConfirmOtpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginPhoneConfirmOtpPage();
    },
  );
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
/// [SideMenuPage]
class SideMenuRoute extends PageRouteInfo<void> {
  const SideMenuRoute({List<PageRouteInfo>? children})
    : super(SideMenuRoute.name, initialChildren: children);

  static const String name = 'SideMenuRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SideMenuPage();
    },
  );
}

/// generated route for
/// [SignUpConfirmOtpPage]
class SignUpConfirmOtpRoute extends PageRouteInfo<void> {
  const SignUpConfirmOtpRoute({List<PageRouteInfo>? children})
    : super(SignUpConfirmOtpRoute.name, initialChildren: children);

  static const String name = 'SignUpConfirmOtpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignUpConfirmOtpPage();
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
