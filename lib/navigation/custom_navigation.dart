import 'package:flutter/material.dart';
import '../data/model/user_model.dart';
import '../main.dart';
import '../main_page/dashboard.dart';
import '../features/splash/page/splash.dart';
import 'routes.dart';


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
        return _pageRoute(const MyApp());
      case Routes.SPLASH:
        return _pageRoute(const Splash());
      case Routes.LOGIN:
        return _pageRoute(const LoginScreen());
      case Routes.FORGET_PASSWORD:
        return _pageRoute(const ForgetPasswordScreen());
      case Routes.VERIFICATION_CODE:
        return _pageRoute(const VerificationScreen());
      case Routes.RESET_PASSWORD:
        return _pageRoute(const ResetPasswordScreen());
      case Routes.DASHBOARD:
        return _pageRoute(const DashBoardScreen());
      case Routes.REQUESTS_FLOW:
        return _pageRoute(RequestFlowScreen(model: settings.arguments as Model,));
      case Routes.ADD_REQUEST:
        return _pageRoute( const AddRequestScreen());
      case Routes.LOAN_REQUEST:
        return _pageRoute( const LoanRequestScreen());
      case Routes.EXPENSE_CLAIM_REQUEST:
        return _pageRoute( const ExpenseRequestScreen());
      case Routes.PERMISSIN_REQUEST:
        return _pageRoute( const PermissionRequestScreen());
      case Routes.VACATION_REQUEST:
        return _pageRoute(const VacationRequest());
      case Routes.BUSINESS_TRIP_REQUEST :
        return _pageRoute(const BusinessTripRequest());
      case Routes.LETTER_REQUEST:
        return _pageRoute(const LetterRequest());
      case Routes.ASSET_REQUEST:
        return _pageRoute(const AssetRequest());
      case Routes.CLEAR_ASSET_REQUEST:
        return _pageRoute(const ClearAssetRequest());
      case Routes.ATTENDANCE_LEAVING:
        return _pageRoute(const AttendanceLeavingScreen());
      case Routes.SETTINGS:
        return _pageRoute(const SettingsScreen());
      case Routes.CHANGE_PASSWORD:
        return _pageRoute(const EditPasswordScreen());
      case Routes.LANGUAGES:
        return _pageRoute(const LanguageScreen());
      case Routes.PERSONAL:
        return _pageRoute( PersonalScreen(user: settings.arguments as UserModel,));
      case Routes.ORGANIZATION:
        return _pageRoute( OrganizationScreen(employee: settings.arguments as UserModel,));
      case Routes.DOCUMENTS :
        return _pageRoute(const DocumentsScreen());
      case Routes.SALARIES_AND_FINANCIAL:
        return _pageRoute(const SalaryScreen());
      case Routes.SALARY_DETAILS:
        return _pageRoute(const SalaryDetailsScreen());
      case Routes.ASSETS:
        return _pageRoute(const AssetsScreen());
      case Routes.CONTRACT:
        return _pageRoute(const ContractScreen());
      default:
        return MaterialPageRoute(builder: (_) => const MyApp());
    }
  }


  static PageRouteBuilder<dynamic> _pageRoute(Widget child) => PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 400),
      reverseTransitionDuration: const Duration(milliseconds: 400),
      transitionsBuilder: (c, anim, a2, child) {
        var begin = const Offset(1.0,0.0);
        var end = Offset.zero;
        var tween = Tween(begin: begin,end: end);
        var curveAnimation=CurvedAnimation(
          parent: anim,curve: Curves.linearToEaseOut);
        return SlideTransition(position: tween.animate(curveAnimation),child: child,);

      },
      opaque: false,
      pageBuilder: (_, __, ___) => child);


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
    }
    else if (replace) {
      return navigatorState.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    }
    else {
      return navigatorState.currentState!
          .pushNamed(routeName, arguments: arguments);
    }
  }
}
