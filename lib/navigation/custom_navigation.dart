import 'package:flutter/material.dart';
import 'package:hr_project/presentation/add_request/add_request_screen.dart';
import 'package:hr_project/presentation/add_request/requests/asset_request.dart';
import 'package:hr_project/presentation/add_request/requests/business_trip_request.dart';
import 'package:hr_project/presentation/add_request/requests/expense_request_Screen.dart';
import 'package:hr_project/presentation/add_request/requests/letter_request.dart';
import 'package:hr_project/presentation/add_request/requests/loan_request_screen.dart';
import 'package:hr_project/presentation/add_request/requests/vacation_request.dart';
import 'package:hr_project/presentation/auth/login_screen.dart';
import 'package:hr_project/presentation/dashBoard/dashboard_screen.dart';
import 'package:hr_project/presentation/profile/units/contract/contract_screen.dart';
import 'package:hr_project/presentation/profile/units/documents/documents_screen.dart';
import 'package:hr_project/presentation/profile/units/organization/organization_screen.dart';
import 'package:hr_project/presentation/profile/units/personal/personal_screen.dart';
import 'package:hr_project/presentation/requests/request_flow_screen.dart';
import 'package:hr_project/presentation/settings/edit_password_screen.dart';
import 'package:hr_project/presentation/settings/language_screen.dart';
import '../data/model/user_model.dart';
import '../main.dart';
import '../presentation/add_request/requests/clear_asset_request.dart';
import '../presentation/add_request/requests/permission_details.dart';
import '../presentation/auth/forget_password_screen.dart';
import '../presentation/auth/reset_password_screen.dart';
import '../presentation/auth/verification_screen.dart';
import '../presentation/home/attendance_leaving_screen.dart';
import '../presentation/profile/units/assets/assets_screen.dart';
import '../presentation/profile/units/salary/salary_details_screen.dart';
import '../presentation/profile/units/salary/salary_screen.dart';
import '../presentation/settings/settings_screen.dart';
import '../splash.dart';
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
