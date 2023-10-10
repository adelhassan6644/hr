import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/dio/dio_client.dart';
import '../app/core/app_storage_keys.dart';

class DashboardRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  DashboardRepo({required this.dioClient, required this.sharedPreferences});


  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppStorageKey.isLogin);
  }

}
