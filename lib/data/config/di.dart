import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app/localization/provider/localization_provider.dart';
import '../../app/theme/theme_provider/theme_provider.dart';
import '../../features/add_request/provider/add_request_provider.dart';
import '../../features/auth/provider/auth_provider.dart';
import '../../features/language/provider/language_provider.dart';
import '../../features/profile/provider/profile_provider.dart';
import '../../features/splash/provider/splash_provider.dart';
import '../../features/splash/repo/splash_repo.dart';
import '../api/end_points.dart';
import '../dio/dio_client.dart';
import '../dio/logging_interceptor.dart';
import '../model/user_model.dart';
import '../../features/auth/repo/auth_repo.dart';
import '../../features/profile/repo/profile_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => DioClient(EndPoints.baseUrl,
      dio: sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  //Model
  sl.registerLazySingleton(() => UserModel());

  // Repository
  sl.registerLazySingleton(() => SplashRepo(sharedPreferences: sl()));
  sl.registerLazySingleton(() => AuthRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => ProfileRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(
      () => AttendanceRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(
      () => AttendanceSchedulesRepo(sharedPreferences: sl(), dioClient: sl()));

  //use Case

  //provider
  sl.registerLazySingleton(() => LanguageProvider());
  sl.registerLazySingleton(() => ThemeProvider(sharedPreferences: sl()));
  sl.registerLazySingleton(() => LocalizationProvider(sharedPreferences: sl()));
  sl.registerLazySingleton(() => SplashProvider(splashRepo: sl()));

  sl.registerLazySingleton(() => AuthProvider(authRepo: sl()));
  sl.registerLazySingleton(() => ProfileProvider(user: sl(), profileRepo: sl()));
  sl.registerLazySingleton(() => AddRequestProvider());

  sl.registerLazySingleton(() => AttendanceProvider(repo: sl()));
  sl.registerLazySingleton(() => AttendanceScheduleProvider(attendanceSchedulesRepo: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}
