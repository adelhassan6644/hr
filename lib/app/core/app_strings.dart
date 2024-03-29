class AppStrings {
  static const String appName = 'يُسر بلس';
  static const String fontFamily = 'URWDINArabic';
  static const String noRouteFound = 'No Route Found';
  static const String cachedRandomQuote = 'CACHED_RANDOM_QUOTE';
  static const String contentType = 'Content-Type';
  static const String applicationJson = 'application/json';
  static const String serverFailure = 'Server Failure';
  static const String cacheFailure = 'Cache Failure';
  static const String unexpectedError = 'Unexpected Error';
  static const String englishCode = 'en';
  static const String arabicCode = 'ar';
  static const String locale = 'locale';

  static status(int? status) {
    if (status == 2) {
      return "rejected";
    } else if (status == 1) {
      return "approved";
    } else {
      return "pending";
    }
  }

  static activationStatus(int? status) {
    if (status == 1) {
      return "active";
    } else {
      return "inactive";
    }
  }
}
