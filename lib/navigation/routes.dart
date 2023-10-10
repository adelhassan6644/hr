abstract class Routes {
  static const APP = "APP";
  static const SPLASH = "SPLASH";
  static const LOGIN = "LOGIN";
  static const FORGET_PASSWORD = "FORGET_PASSWORD";
  static const VERIFICATION = "VERIFICATION_CODE";
  static const RESET_PASSWORD = "RESET_PASSWORD";
  static const DASHBOARD = "DASHBOARD";
  static const ADD_REQUEST = "ADD_REQUEST";
  static const LOAN_REQUEST = "LOAN_REQUEST";
  static const EXPENSE_CLAIM_REQUEST = "EXPENSE_CLAIM_REQUEST";
  static const PERMISSIN_REQUEST = "PERMISSION_REQUEST";
  static const VACATION_REQUEST = "VACATION_REQUEST";
  static const LETTER_REQUEST = "LETTER_REQUEST";
  static const ASSET_REQUEST = "ASSET_REQUEST";
  static const CLEAR_ASSET_REQUEST = "CLEAR_ASSET_REQUEST";

  static const REQUESTS_DETAILS = "REQUESTS_DETAILS";
  static const SALARIES_AND_FINANCIAL = "SALARIES_AND_FINANCIAL";
  static const SALARY_DETAILS = "SALARY_DETAILS";
  static const SETTINGS = "SETTINGS";
  static const CHANGE_PASSWORD = "CHANGE_PASSWORD";
  static const LANGUAGES = "LANGUAGES";
  static const PROFILE = "PROFILE";
  static const ORGANIZATION = "ORGANIZATION";
  static const ASSETS = "ASSETS";
  static const DOCUMENTS = "DOCUMENTS";
  static const CONTRACT = "CONTRACT";
  static const NOTIFICATIONS = "NOTIFICATIONS";
  static const PDF = "PDF";
}

//
// final GoRouter _router = GoRouter(
//   initialLocation: Routes.APP,
//   routes: <RouteBase>[
//     GoRoute(
//       name:Routes.APP,
//       path:  Routes.APP,
//       builder: (BuildContext context, GoRouterState state) {
//         return const MyApp();
//       },
//       routes: <RouteBase>[
//         GoRoute(
//           name:Routes.SPLASH,
//           path:  Routes.SPLASH,
//           builder: (BuildContext context, GoRouterState state) {
//             return const Splash();
//           },),
//         GoRoute(
//           name: Routes.LOGIN ,
//           path: Routes.LOGIN ,
//           builder: (BuildContext context, GoRouterState state) {
//             return const LoginScreen();
//           },
//         ),
//         GoRoute(
//           name:  Routes.FORGET_PASSWORD,
//           path: Routes.FORGET_PASSWORD,
//           builder: (BuildContext context, GoRouterState state) {
//             return const ForgetPasswordScreen();
//           },
//         ),
//         GoRoute(
//           name: Routes.VERIFICATION_CODE,
//           path: Routes.VERIFICATION_CODE,
//           builder: (BuildContext context, GoRouterState state) {
//             return const VerificationScreen();
//           },
//         ),
//         GoRoute(
//           name: Routes.RESET_PASSWORD,
//           path: Routes.RESET_PASSWORD,
//           builder: (BuildContext context, GoRouterState state) {
//             return const ResetPasswordScreen();
//           },
//         ),
//         //DASHBOARD
//         GoRoute(
//             name: Routes.DASHBOARD,
//             path: Routes.DASHBOARD,
//             builder: (BuildContext context, GoRouterState state) {
//               return const DashBoardScreen();
//             },
//             routes:[
//               GoRoute(
//                 name: Routes.HOME_PAGE,
//                 path: Routes.HOME_PAGE,
//                 builder: (BuildContext context, GoRouterState state) {
//                   return const HomeScreen();
//                 },
//               ),
//               GoRoute(
//                 name: Routes.PROFILE_PAGE,
//                 path: Routes.PROFILE_PAGE,
//                 builder: (BuildContext context, GoRouterState state) {
//                   return const ProfileScreen();
//                 },
//               ),
//             ]
//         ),
//         GoRoute(
//           name: Routes.SETTINGS,
//           path: Routes.SETTINGS,
//           builder: (BuildContext context, GoRouterState state) {
//             return const SettingsScreen();
//           },
//         ),
//         GoRoute(
//           name: Routes.LANGUAGES,
//           path: Routes.LANGUAGES,
//           builder: (BuildContext context, GoRouterState state) {
//             return const LanguageScreen();
//           },
//         ),
//         GoRoute(
//           name: Routes.EDIT_PASSWORD,
//           path: Routes.EDIT_PASSWORD,
//           builder: (BuildContext context, GoRouterState state) {
//             return const EditPasswordScreen();
//           },
//         ),
//       ],
//     ),
//   ],
//
// );
//
// GoRouter get route => _router;
