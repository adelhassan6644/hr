
import '../../../domain/localization/language_constant.dart';
import '../../../main.dart';

class Validations {
  static String? email(String? value) {
    if (value!.isEmpty) {
      return getTranslated ("required", MyApp.navigatorKey.currentContext!);
    } else if (!value.contains('@') || !value.contains('.')) {
      return getTranslated ( "must_be_like_this_example@mail.com", MyApp.navigatorKey.currentContext!);
    } else {
      return null;
    }
  }

  static String? any(String? value) {
    if (value!.isEmpty) {
      return getTranslated ("required", MyApp.navigatorKey.currentContext!);
    } else {
      return null;
    }
  }

  static String? phone(String? value) {
    if (value!.isEmpty) {
      return getTranslated ("required", MyApp.navigatorKey.currentContext!);
    } else if (value.length < 8) {
      return  getTranslated ("wrong_phone_number", MyApp.navigatorKey.currentContext!);
    } else {
      return null;
    }
  }

  static String? password(String? value) {
    if (value!.isEmpty) {
      return  getTranslated ("required", MyApp.navigatorKey.currentContext!);
    } else if (value.length < 6) {
      return getTranslated ("6_characters_minimum", MyApp.navigatorKey.currentContext!);
    } else {
      return null;
    }
  }

  static String? code(String value) {
    if (value.isEmpty) {
      return '';
    } else if (value.length < 4) {
      return "LocaleKeys.codeError.tr()";
    } else {
      return null;
    }
  }

  static String? name(
    String? value,
  ) {
    if (value!.isEmpty) {
      return  getTranslated ("required", MyApp.navigatorKey.currentContext!);
    } else if (value.isEmpty) {
      return getTranslated ( "must_be_more_than_one_character", MyApp.navigatorKey.currentContext!);
    } else {
      return null;
    }
  }
}
