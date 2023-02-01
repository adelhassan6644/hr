import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hr_project/presentation/auth/login_screen.dart';
import 'package:hr_project/presentation/notifier/auth_provider.dart';
import 'package:hr_project/presentation/notifier/language_provider.dart';
import 'package:hr_project/presentation/notifier/localization_provider.dart';
import 'package:hr_project/presentation/notifier/profile_provider.dart';
import 'package:hr_project/presentation/notifier/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:upgrader/upgrader.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'app/core/utils/app_storage_keys.dart';
import 'app/theme/dark_theme.dart';
import 'app/theme/light_theme.dart';
import 'di.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app/core/utils/app_strings.dart';
import 'domain/localization/app_localization.dart';

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
    ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<ProfileProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<LanguageProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<LocalizationProvider>()),
  ], child: const MyApp()));
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Locale> _locals = [];
    for (var language in AppStorageKey.languages) {
      _locals.add(Locale(language.languageCode!, language.countryCode));
    }
    return MaterialApp(
      key: navigatorKey,
      title: AppStrings.appName,
      supportedLocales: _locals,
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context,).darkTheme ? dark : light,
      locale: Provider.of<LocalizationProvider>(context,).locale,
      localizationsDelegates:  const [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const LoginScreen(),
    );
  }
}
