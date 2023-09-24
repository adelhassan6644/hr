
import '../../features/language/provider/language_provider.dart';

class AppStorageKey {
  static const String userID = "user_id";
  static const String isLogin = "is_login";
  static const String userKey = "user_key";
  static String firstTimeOnApp = "first_time";
  static const String languageCode = "languageCode";
  static const String countryCode = "countryCode";
  static List<LanguageModel> languages = [
    LanguageModel(imageUrl: 'Images.united_kingdom', languageName: 'english', countryCode: 'US', languageCode: 'en'),
    LanguageModel(imageUrl: 'Images.arabic', languageName: 'arabic', countryCode: 'SA', languageCode: 'ar'),
  ];

}
