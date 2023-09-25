import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:hr_project/data/config/di.dart' as di;

import '../../app/localization/provider/localization_provider.dart';
import '../../app/theme/theme_provider/theme_provider.dart';
import '../../features/add_request/provider/add_request_provider.dart';
import '../../features/language/provider/language_provider.dart';
import '../../features/attendance/provider/attendance_provider.dart';
import '../../features/auth/provider/auth_provider.dart';
import '../../features/profile/provider/profile_provider.dart';
import '../../features/splash/provider/splash_provider.dart';

abstract class ProviderList {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (context) => di.sl<ThemeProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<AddRequestProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<SplashProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<ProfileProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<LanguageProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<LocalizationProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<AttendanceProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<AttendanceProvider>()),
  ];
}
