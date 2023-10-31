import '../../features/language/model/language_model.dart';
import 'images.dart';

class AppStorageKey {
  static const String domain = "domain";
  static const String userID = "user_id";
  static const String token = "token";
  static const String isLogin = "is_login";
  static const String inAttendanceForm = "in_attendance_form";
  static const String userKey = "user_key";
  static String firstTimeOnApp = "first_time";
  static const String languageCode = "languageCode";
  static const String countryCode = "countryCode";
  static List<LanguageModel> languages = [
    LanguageModel(
        icon: Images.english,
        name: 'English',
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        icon: Images.arabic,
        name: "عربي",
        countryCode: 'SA',
        languageCode: 'ar'),
  ];
}
