import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_project/presentation/auth/login_screen.dart';
import 'package:hr_project/presentation/dashBoard/dashboard_screen.dart';
import 'package:hr_project/presentation/home/home_Screen.dart';
import 'package:hr_project/presentation/profile/profile_screen.dart';
import 'package:hr_project/presentation/settings/edit_password_screen.dart';
import 'package:hr_project/presentation/settings/language_screen.dart';
import '../main.dart';
import '../presentation/auth/forget_password_screen.dart';
import '../presentation/auth/reset_password_screen.dart';
import '../presentation/auth/verification_screen.dart';
import '../presentation/settings/settings_screen.dart';
import '../splash.dart';
import 'routes.dart';

const begin = Offset(0.0, 1.0);
const end = Offset.zero;
const curve = Curves.bounceInOut;
var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

abstract class CustomNavigator {
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();
  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();
  static final GlobalKey<ScaffoldMessengerState> scaffoldState =
      GlobalKey<ScaffoldMessengerState>();

  static Route<dynamic> onCreateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.APP:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const MyApp(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
      case Routes.SPLASH:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            const Splash(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
      case Routes.LOGIN:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            const LoginScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
      case Routes.FORGET_PASSWORD:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            const ForgetPasswordScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
      case Routes.VERIFICATION_CODE:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            const VerificationScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
      case Routes.RESET_PASSWORD:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            const ResetPasswordScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
        case Routes.DASHBOARD:
          return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
              const DashBoardScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              });
      case Routes.PROFILE_PAGE:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            const ProfileScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
        case Routes.HOME_PAGE:
          return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
              const HomeScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              });
      case Routes.SETTINGS:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            const SettingsScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
        case Routes.EDIT_PASSWORD:
          return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
              const EditPasswordScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              });
        case Routes.LANGUAGES:
          return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
              const LanguageScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              });

      default:
        return MaterialPageRoute(builder: (_) => const MyApp());
    }
  }

  static pop({dynamic result}) {
    if (navigatorState.currentState!.canPop()) {
      navigatorState.currentState!.pop(result);
    }
  }

  static push(String routeName,
      {arguments, bool replace = false, bool clean = false}) {
    if (clean) {
      return navigatorState.currentState!.pushNamedAndRemoveUntil(
          routeName, (_) => false,
          arguments: arguments);
    } else if (replace) {
      return navigatorState.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    } else {
      return navigatorState.currentState!
          .pushNamed(routeName, arguments: arguments);
    }
  }
}
