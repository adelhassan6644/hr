import 'package:provider/provider.dart';
import 'presentation/notifier/attendance_schedules_provider.dart';
import 'di.dart' as di;
import 'presentation/notifier/add_request_provider.dart';
import 'presentation/notifier/attendance_repo_provider.dart';
import 'presentation/notifier/auth_provider.dart';
import 'presentation/notifier/language_provider.dart';
import 'presentation/notifier/localization_provider.dart';
import 'presentation/notifier/profile_provider.dart';
import 'presentation/notifier/theme_provider.dart';

abstract class MainProvider{
  static List<ChangeNotifierProvider> providers =[
    ChangeNotifierProvider(create: (context) => di.sl<ThemeProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<AddRequestProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<ProfileProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<LanguageProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<LocalizationProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<AttendanceProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<AttendanceScheduleProvider>()),

  ];
}