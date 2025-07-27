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
class BottomNavigationBarRoute
    extends PageRouteInfo<BottomNavigationBarRouteArgs> {
  BottomNavigationBarRoute({
    Key? key,
    Widget? drawer,
    List<PageRouteInfo>? children,
  }) : super(
         BottomNavigationBarRoute.name,
         args: BottomNavigationBarRouteArgs(key: key, drawer: drawer),
         initialChildren: children,
       );

  static const String name = 'BottomNavigationBarRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BottomNavigationBarRouteArgs>(
        orElse: () => const BottomNavigationBarRouteArgs(),
      );
      return BottomNavigationBarPage(key: args.key, drawer: args.drawer);
    },
  );
}

class BottomNavigationBarRouteArgs {
  const BottomNavigationBarRouteArgs({this.key, this.drawer});

  final Key? key;

  final Widget? drawer;

  @override
  String toString() {
    return 'BottomNavigationBarRouteArgs{key: $key, drawer: $drawer}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BottomNavigationBarRouteArgs) return false;
    return key == other.key && drawer == other.drawer;
  }

  @override
  int get hashCode => key.hashCode ^ drawer.hashCode;
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
class CreateAnAccountRoute extends PageRouteInfo<CreateAnAccountRouteArgs> {
  CreateAnAccountRoute({
    required ContactType contactType,
    required TextEditingController emailController,
    required TextEditingController phoneController,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         CreateAnAccountRoute.name,
         args: CreateAnAccountRouteArgs(
           contactType: contactType,
           emailController: emailController,
           phoneController: phoneController,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'CreateAnAccountRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateAnAccountRouteArgs>();
      return CreateAnAccountPage(
        args.contactType,
        args.emailController,
        args.phoneController,
        key: args.key,
      );
    },
  );
}

class CreateAnAccountRouteArgs {
  const CreateAnAccountRouteArgs({
    required this.contactType,
    required this.emailController,
    required this.phoneController,
    this.key,
  });

  final ContactType contactType;

  final TextEditingController emailController;

  final TextEditingController phoneController;

  final Key? key;

  @override
  String toString() {
    return 'CreateAnAccountRouteArgs{contactType: $contactType, emailController: $emailController, phoneController: $phoneController, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CreateAnAccountRouteArgs) return false;
    return contactType == other.contactType &&
        emailController == other.emailController &&
        phoneController == other.phoneController &&
        key == other.key;
  }

  @override
  int get hashCode =>
      contactType.hashCode ^
      emailController.hashCode ^
      phoneController.hashCode ^
      key.hashCode;
}

/// generated route for
/// [CustomConfirmOtpPage]
class CustomConfirmOtpRoute extends PageRouteInfo<CustomConfirmOtpRouteArgs> {
  CustomConfirmOtpRoute({
    required TextEditingController phoneController,
    required TextEditingController emailController,
    required ContactType contactType,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         CustomConfirmOtpRoute.name,
         args: CustomConfirmOtpRouteArgs(
           phoneController: phoneController,
           emailController: emailController,
           contactType: contactType,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'CustomConfirmOtpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CustomConfirmOtpRouteArgs>();
      return CustomConfirmOtpPage(
        args.phoneController,
        args.emailController,
        args.contactType,
        key: args.key,
      );
    },
  );
}

class CustomConfirmOtpRouteArgs {
  const CustomConfirmOtpRouteArgs({
    required this.phoneController,
    required this.emailController,
    required this.contactType,
    this.key,
  });

  final TextEditingController phoneController;

  final TextEditingController emailController;

  final ContactType contactType;

  final Key? key;

  @override
  String toString() {
    return 'CustomConfirmOtpRouteArgs{phoneController: $phoneController, emailController: $emailController, contactType: $contactType, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CustomConfirmOtpRouteArgs) return false;
    return phoneController == other.phoneController &&
        emailController == other.emailController &&
        contactType == other.contactType &&
        key == other.key;
  }

  @override
  int get hashCode =>
      phoneController.hashCode ^
      emailController.hashCode ^
      contactType.hashCode ^
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
