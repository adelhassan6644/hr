import 'package:flutter/material.dart';
import 'package:yusrPlus/features/forced_attendance_form/page/forced_attendance_form.dart';
import '../components/custom_pdf.dart';
import '../features/add_request/page/add_request.dart';
import '../features/add_request/requests/expenses_request/page/expense_request.dart';
import '../features/add_request/requests/loan_request/page/loan_request.dart';
import '../features/add_request/requests/permission_request/page/permission_request.dart';
import '../features/add_request/requests/pledge_request/page/cancel_pledge_request.dart';
import '../features/add_request/requests/pledge_request/page/pledge_request.dart';
import '../features/add_request/requests/vacation_request/page/vacation_request.dart';
import '../features/auth/pages/add_domain.dart';
import '../features/covenant/page/covenant.dart';
import '../features/auth/pages/forget_password.dart';
import '../features/auth/pages/login.dart';
import '../features/auth/pages/reset_password.dart';
import '../features/auth/pages/verification.dart';
import '../features/auth/pages/change_password.dart';
import '../features/contract/page/contract.dart';
import '../features/documents/page/documents.dart';
import '../features/language/page/language_bottom_sheet.dart';
import '../features/notifications/page/notifications_page.dart';
import '../features/setting/page/settings.dart';
import '../features/organization/page/organization.dart';
import '../features/profile/page/profile.dart';
import '../features/salary/page/salary.dart';
import '../features/salary/page/salary_details.dart';
import '../features/request_details/page/request_details.dart';
import '../main.dart';
import '../main_page/page/dashboard.dart';
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
      case Routes.AddDomain:
        return _pageRoute(const AddDomainScreen());

      case Routes.FORGET_PASSWORD:
        return _pageRoute(const ForgetPassword());
      case Routes.VERIFICATION:
        return _pageRoute(const VerificationScreen());
      case Routes.RESET_PASSWORD:
        return _pageRoute(const ResetPassword());
      case Routes.DASHBOARD:
        return _pageRoute(const DashBoardScreen());
      case Routes.REQUESTS_DETAILS:
        return _pageRoute(const RequestDetails());

      ///Requests
      case Routes.ADD_REQUEST:
        return _pageRoute(const AddRequest());

      case Routes.LOAN_REQUEST:
        return _pageRoute(const LoanRequest());

      case Routes.EXPENSE_CLAIM_REQUEST:
        return _pageRoute(const ExpenseRequest());

      case Routes.PERMISSIN_REQUEST:
        return _pageRoute(const PermissionRequest());

      case Routes.VACATION_REQUEST:
        return _pageRoute(const VacationRequest());

      case Routes.ASSET_REQUEST:
        return _pageRoute(const PledgeRequest());

      case Routes.CLEAR_ASSET_REQUEST:
        return _pageRoute(const CancelPledgeRequest());

      case Routes.SETTINGS:
        return _pageRoute(const SettingsScreen());
      case Routes.CHANGE_PASSWORD:
        return _pageRoute(const ChangePassword());
      case Routes.LANGUAGES:
        return _pageRoute(const LanguageBottomSheet());
      case Routes.PROFILE:
        return _pageRoute(const Profile());

      case Routes.NOTIFICATIONS:
        return _pageRoute(const NotificationsPage());

      case Routes.FORCED_ATTENDANCE_FORM:
        return _pageRoute(ForcedAttendanceForm(id: settings.arguments as int));

      case Routes.ORGANIZATION:
        return _pageRoute(const Organization());

      case Routes.DOCUMENTS:
        return _pageRoute(const DocumentsScreen());

      case Routes.SALARIES_AND_FINANCIAL:
        return _pageRoute(const Salary());

      case Routes.SALARY_DETAILS:
        return _pageRoute(const SalaryDetailsScreen());

      case Routes.ASSETS:
        return _pageRoute(const Covenant());

      case Routes.CONTRACT:
        return _pageRoute(const ContractScreen());

      case Routes.PDF:
        return _pageRoute(CustomPDF(
          url: settings.arguments as String,
        ));
      default:
        return MaterialPageRoute(builder: (_) => const MyApp());
    }
  }

  static PageRouteBuilder<dynamic> _pageRoute(Widget child) => PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 100),
      reverseTransitionDuration: const Duration(milliseconds: 100),
      transitionsBuilder: (c, anim, a2, child) {
        var begin = const Offset(1.0, 0.0);
        var end = Offset.zero;
        var tween = Tween(begin: begin, end: end);
        var curveAnimation =
            CurvedAnimation(parent: anim, curve: Curves.linearToEaseOut);
        return SlideTransition(
          position: tween.animate(curveAnimation),
          child: child,
        );
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
    } else if (replace) {
      return navigatorState.currentState!.pushReplacementNamed(
        routeName,
        arguments: arguments,
      );
    } else {
      return navigatorState.currentState!
          .pushNamed(routeName, arguments: arguments);
    }
  }
}
