import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/add_request/requests/expenses_request/repo/expenses_request_repo.dart';
import '../../features/add_request/requests/loan_request/repo/loan_request_repo.dart';
import '../../features/add_request/requests/permission_request/repo/permission_request_repo.dart';
import '../../features/add_request/requests/pledge_request/repo/pledge_request_repo.dart';
import '../../features/add_request/requests/vacation_request/repo/vacation_request_repo.dart';
import '../../features/covenant/provider/covenant_provider.dart';
import '../../features/covenant/repo/covenant_repo.dart';
import '../../features/language/provider/localization_provider.dart';
import '../../app/theme/theme_provider/theme_provider.dart';
import '../../features/attendance/provider/attendance_provider.dart';
import '../../features/attendance/repo/attendance_repo.dart';
import '../../features/auth/provider/auth_provider.dart';
import '../../features/home/provider/home_provider.dart';
import '../../features/home/repo/home_repo.dart';
import '../../features/notifications/provider/notifications_provider.dart';
import '../../features/notifications/repo/notifications_repo.dart';
import '../../features/requests/provider/requests_provider.dart';
import '../../features/requests/repo/requests_repo.dart';
import '../../main_providers/user_provider.dart';
import '../../features/salary/provider/salary_provider.dart';
import '../../features/salary/repo/salary_repo.dart';
import '../../features/config/provider/config_provider.dart';
import '../../features/config/repo/config_repo.dart';
import '../../features/splash/provider/splash_provider.dart';
import '../../features/splash/repo/splash_repo.dart';
import '../../main_page/provider/dashboard_provider.dart';
import '../api/end_points.dart';
import '../dio/dio_client.dart';
import '../dio/logging_interceptor.dart';
import '../../features/auth/repo/auth_repo.dart';
import '../../main_repos/user_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => DioClient(EndPoints.baseUrl,
      dio: sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  // Repository
  sl.registerLazySingleton(() => UserRepo(sharedPreferences: sl()));
  sl.registerLazySingleton(() => SplashRepo(sharedPreferences: sl()));
  sl.registerLazySingleton(
      () => AuthRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(
      () => HomeRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(
      () => SalaryRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(
      () => CovenantRepo(sharedPreferences: sl(), dioClient: sl()));

  sl.registerLazySingleton(
      () => AttendanceRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(
      () => ConfigRepo(sharedPreferences: sl(), dioClient: sl()));

  sl.registerLazySingleton(
      () => RequestsRepo(sharedPreferences: sl(), dioClient: sl()));

  sl.registerLazySingleton(
      () => LoanRequestRepo(sharedPreferences: sl(), dioClient: sl()));

  sl.registerLazySingleton(
      () => PledgeRequestRepo(sharedPreferences: sl(), dioClient: sl()));

  sl.registerLazySingleton(
      () => PermissionRequestRepo(sharedPreferences: sl(), dioClient: sl()));

  sl.registerLazySingleton(
      () => VacationRequestRepo(sharedPreferences: sl(), dioClient: sl()));

  sl.registerLazySingleton(
      () => ExpensesRequestRepo(sharedPreferences: sl(), dioClient: sl()));

  sl.registerLazySingleton(
      () => NotificationsRepo(sharedPreferences: sl(), dioClient: sl()));

  //use Case

  //provider
  sl.registerLazySingleton(() => ThemeProvider(sharedPreferences: sl()));
  sl.registerLazySingleton(() => LocalizationProvider(sharedPreferences: sl()));
  sl.registerLazySingleton(() => SplashProvider(splashRepo: sl()));
  sl.registerLazySingleton(() => AuthProvider(authRepo: sl()));
  sl.registerLazySingleton(() => UserProvider(repo: sl()));
  sl.registerLazySingleton(() => DashboardProvider());
  sl.registerLazySingleton(() => HomeProvider(repo: sl()));
  sl.registerLazySingleton(() => SalaryProvider(repo: sl()));
  sl.registerLazySingleton(() => CovenantProvider(repo: sl()));
  sl.registerLazySingleton(() => AttendanceProvider(repo: sl()));
  sl.registerLazySingleton(() => RequestsProvider(repo: sl()));
  sl.registerLazySingleton(() => NotificationsProvider(repo: sl()));
  sl.registerLazySingleton(() => ConfigProvider(repo: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}
