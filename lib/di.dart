import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hr_project/domain/repositery/attendance_repo.dart';
import 'package:hr_project/presentation/notifier/add_request_provider.dart';
import 'package:hr_project/presentation/notifier/attendance_repo_provider.dart';
import 'package:hr_project/presentation/notifier/auth_provider.dart';
import 'package:hr_project/presentation/notifier/language_provider.dart';
import 'package:hr_project/presentation/notifier/localization_provider.dart';
import 'package:hr_project/presentation/notifier/profile_provider.dart';
import 'package:hr_project/presentation/notifier/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/core/api/end_points.dart';
import 'data/dio/dio_client.dart';
import 'data/dio/logging_interceptor.dart';
import 'data/model/user_model.dart';
import 'domain/repositery/auth_repo.dart';
import 'domain/repositery/profile_repo.dart';


final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => DioClient(
        EndPoints.baseUrl,
        dio: sl(),
        loggingInterceptor: sl(),
    sharedPreferences: sl()
      ));

  //Model
  sl.registerLazySingleton(() => UserModel());





  // Repository
  sl.registerLazySingleton(() => AuthRepo(sharedPreferences: sl(), dioClient: sl() ));
  sl.registerLazySingleton(() => ProfileRepo(sharedPreferences: sl(), dioClient: sl() ));
  sl.registerLazySingleton(() => AttendanceRepo(sharedPreferences: sl(), dioClient: sl() ));




  //use Case




  //provider
   sl.registerLazySingleton(() => AuthProvider(authRepo: sl()));
   sl.registerLazySingleton(() => ProfileProvider(user:sl() ,profileRepo: sl() ));
   sl.registerLazySingleton(() => AddRequestProvider());
   sl.registerLazySingleton(() => ThemeProvider(sharedPreferences: sl()));
   sl.registerLazySingleton(() => LocalizationProvider(sharedPreferences: sl()));
   sl.registerLazySingleton(() => AttendanceProvider(attendanceRepo: sl()));
   sl.registerLazySingleton(() => LanguageProvider());

  // External
  // sl.registerLazySingleton(() => Go(sharedPreferences: sl()));
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}
