import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:yusrPlus/data/config/di.dart' as di;

import '../../features/contract/provider/contract_provider.dart';
import '../../features/covenant/provider/covenant_provider.dart';
import '../../features/forced_attendance_form/provider/forced_attendance_form_provider.dart';
import '../../features/language/provider/localization_provider.dart';
import '../../app/theme/theme_provider/theme_provider.dart';
import '../../features/home/provider/home_provider.dart';
import '../../features/attendance/provider/attendance_provider.dart';
import '../../features/auth/provider/auth_provider.dart';
import '../../features/notifications/provider/notifications_provider.dart';
import '../../features/profile/provider/profile_provider.dart';
import '../../features/requests/provider/requests_provider.dart';
import '../../main_providers/user_provider.dart';
import '../../features/salary/provider/salary_provider.dart';
import '../../features/config/provider/config_provider.dart';
import '../../features/splash/provider/splash_provider.dart';
import '../../main_page/provider/dashboard_provider.dart';

abstract class ProviderList {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (context) => di.sl<ThemeProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<DashboardProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<SplashProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<UserProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<ProfileProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<LocalizationProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<HomeProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<AttendanceProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<SalaryProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<CovenantProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<RequestsProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<ContractProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<NotificationsProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<ConfigProvider>()),
    // ChangeNotifierProvider(create: (context) => di.sl<ForcedAttendanceFormProvider>()),
  ];
}
