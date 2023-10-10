import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/core/app_storage_keys.dart';

class SplashRepo {
  final SharedPreferences sharedPreferences;
  SplashRepo({required this.sharedPreferences});

  bool isLogin() {
    return sharedPreferences.containsKey(AppStorageKey.isLogin);
  }
}
