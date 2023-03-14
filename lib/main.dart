import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hr_project/navigation/custom_navigation.dart';
import 'package:hr_project/presentation/auth/login_screen.dart';
import 'package:hr_project/presentation/notifier/localization_provider.dart';
import 'package:hr_project/presentation/notifier/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:upgrader/upgrader.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'app/core/utils/app_storage_keys.dart';
import 'app/core/utils/un_focus.dart';
import 'app/theme/dark_theme.dart';
import 'app/theme/light_theme.dart';
import 'di.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app/core/utils/app_strings.dart';
import 'domain/localization/app_localization.dart';
import 'navigation/routes.dart';
import 'presentation/notifier/attendance_schedules_provider.dart';
import 'presentation/notifier/add_request_provider.dart';
import 'presentation/notifier/attendance_repo_provider.dart';
import 'presentation/notifier/auth_provider.dart';
import 'presentation/notifier/language_provider.dart';
import 'presentation/notifier/profile_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  if (kDebugMode) {
    await Upgrader.clearSavedSettings();
  }

  await di.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => di.sl<ThemeProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<AddRequestProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<ProfileProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<LanguageProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<LocalizationProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<AttendanceProvider>()),
    ChangeNotifierProvider(
        create: (context) => di.sl<AttendanceScheduleProvider>()),
  ], child: const MyApp()));
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Locale> locals = [];
    for (var language in AppStorageKey.languages) {
      locals.add(Locale(language.languageCode!, language.countryCode));
    }
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light));
    return MaterialApp(
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Unfocus(child: child!)),
      initialRoute: Routes.SPLASH,
      navigatorKey: CustomNavigator.navigatorState,
      onGenerateRoute: CustomNavigator.onCreateRoute,
      navigatorObservers: [CustomNavigator.routeObserver],
      title: AppStrings.appName,
      supportedLocales: locals,
      scaffoldMessengerKey: CustomNavigator.scaffoldState,
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(
        context,
      ).darkTheme
          ? dark
          : light,
      locale: Provider.of<LocalizationProvider>(
        context,
      ).locale,
      localizationsDelegates: const [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const LoginScreen(),
    );
  }
}
