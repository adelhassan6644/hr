import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hr_project/presentation/notifier/auth_provider.dart';
import 'package:hr_project/presentation/notifier/language_provider.dart';
import 'package:hr_project/presentation/notifier/localization_provider.dart';
import 'package:hr_project/presentation/notifier/profile_provider.dart';
import 'package:hr_project/presentation/notifier/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/core/api/end_points.dart';
import 'data/dio/dio_client.dart';
import 'data/dio/logging_interceptor.dart';
import 'domain/repositery/auth_repo.dart';


final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => DioClient(
        EndPoints.baseUrl,
        dio: sl(),
        loggingInterceptor: sl(),
      ));

  // Repository
  sl.registerLazySingleton(() => AuthRepo(sharedPreferences: sl(), dioClient: sl() ));




  //use Case




  //provider
   sl.registerLazySingleton(() => AuthProvider());
   sl.registerLazySingleton(() => ProfileProvider());
   sl.registerLazySingleton(() => ThemeProvider(sharedPreferences: sl()));
   sl.registerLazySingleton(() => LocalizationProvider(sharedPreferences: sl()));
   sl.registerLazySingleton(() => LanguageProvider());

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}
