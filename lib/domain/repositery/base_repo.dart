import 'package:shared_preferences/shared_preferences.dart';

import '../../app/core/utils/app_storage_keys.dart';
import '../../data/dio/dio_client.dart';

class BaseRepo {
  final SharedPreferences sharedPreferences;
  final DioClient dioClient;
  BaseRepo({required this.sharedPreferences, required this.dioClient});

 int  currentUserID(){
 return   sharedPreferences.getInt(AppStorageKey.userID)!;
  }
}