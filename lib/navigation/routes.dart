import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hr_project/main.dart';
import 'package:hr_project/presentation/auth/forget_password_screen.dart';
import 'package:hr_project/presentation/auth/login_screen.dart';
import 'package:hr_project/presentation/auth/reset_password_screen.dart';
import 'package:hr_project/presentation/auth/verification_screen.dart';
import 'package:hr_project/presentation/dashBoard/dashboard_screen.dart';
import 'package:hr_project/presentation/home/home_Screen.dart';
import 'package:hr_project/presentation/profile/profile_screen.dart';
import 'package:hr_project/presentation/settings/edit_password_screen.dart';
import 'package:hr_project/presentation/settings/language_screen.dart';
import 'package:hr_project/presentation/settings/settings_screen.dart';
import 'package:hr_project/splash.dart';

class Routes {
  static const APP = "/APP";
  static const SPLASH = "/SPLASH";
  static const LOGIN = "/LOGIN";
  static const FORGET_PASSWORD = "/FORGET_PASSWORD";
  static const VERIFICATION_CODE = "/VERIFICATION_CODE";
  static const RESET_PASSWORD = "/RESET_PASSWORD";
  static const DASHBOARD = "/DASHBOARD";
  static const HOME_PAGE = "/HOME_PAGE";
  static const PROFILE_PAGE = "/PROFILE_PAGE";
  static const REQUESTS_PAGE= "/REQUESTS_PAGE";
  static const ATTENDANCE_PAGE = "/ATTENDANCE_PAGE";
  static const SALARIES_AND_FINANCIAL= "/SALARIES_AND_FINANCIAL";
  static const SETTINGS = "/SETTINGS";
  static const EDIT_PASSWORD = "/EDIT_PASSWORD";
  static const LANGUAGES = "/LANGUAGES";
}

final GoRouter _router = GoRouter(
  initialLocation: Routes.APP,
  routes: <RouteBase>[
    GoRoute(
      name:Routes.APP,
      path:  Routes.APP,
      builder: (BuildContext context, GoRouterState state) {
        return const MyApp();
      },
      routes: <RouteBase>[
        GoRoute(
          name:Routes.SPLASH,
          path:  Routes.SPLASH,
          builder: (BuildContext context, GoRouterState state) {
            return const Splash();
          },),
        GoRoute(
          name: Routes.LOGIN ,
          path: Routes.LOGIN ,
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          },
        ),
        GoRoute(
          name:  Routes.FORGET_PASSWORD,
          path: Routes.FORGET_PASSWORD,
          builder: (BuildContext context, GoRouterState state) {
            return const ForgetPasswordScreen();
          },
        ),
        GoRoute(
          name: Routes.VERIFICATION_CODE,
          path: Routes.VERIFICATION_CODE,
          builder: (BuildContext context, GoRouterState state) {
            return const VerificationScreen();
          },
        ),
        GoRoute(
          name: Routes.RESET_PASSWORD,
          path: Routes.RESET_PASSWORD,
          builder: (BuildContext context, GoRouterState state) {
            return const ResetPasswordScreen();
          },
        ),
        //DASHBOARD
        GoRoute(
            name: Routes.DASHBOARD,
            path: Routes.DASHBOARD,
            builder: (BuildContext context, GoRouterState state) {
              return const DashBoardScreen();
            },
            routes:[
              GoRoute(
                name: Routes.HOME_PAGE,
                path: Routes.HOME_PAGE,
                builder: (BuildContext context, GoRouterState state) {
                  return const HomeScreen();
                },
              ),
              GoRoute(
                name: Routes.PROFILE_PAGE,
                path: Routes.PROFILE_PAGE,
                builder: (BuildContext context, GoRouterState state) {
                  return const ProfileScreen();
                },
              ),
            ]
        ),
        GoRoute(
          name: Routes.SETTINGS,
          path: Routes.SETTINGS,
          builder: (BuildContext context, GoRouterState state) {
            return const SettingsScreen();
          },
        ),
        GoRoute(
          name: Routes.LANGUAGES,
          path: Routes.LANGUAGES,
          builder: (BuildContext context, GoRouterState state) {
            return const LanguageScreen();
          },
        ),
        GoRoute(
          name: Routes.EDIT_PASSWORD,
          path: Routes.EDIT_PASSWORD,
          builder: (BuildContext context, GoRouterState state) {
            return const EditPasswordScreen();
          },
        ),
      ],
    ),
  ],

);

GoRouter get route => _router;