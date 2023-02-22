
import '../../../domain/localization/language_constant.dart';
import '../../../main.dart';
import '../../../navigation/custom_navigation.dart';

class Validations {
  static String? email(String? value) {
    if (value!.isEmpty) {
      return getTranslated ("required",  CustomNavigator.scaffoldState.currentContext!);
    } else if (!value.contains('@') || !value.contains('.')) {
      return getTranslated ( "must_be_like_this_example@mail.com",  CustomNavigator.scaffoldState.currentContext!);
    } else {
      return null;
    }
  }

  static String? any(String? value) {
    if (value!.isEmpty) {
      return getTranslated ("required",  CustomNavigator.scaffoldState.currentContext!);
    } else {
      return null;
    }
  }

  static String? phone(String? value) {
    if (value!.isEmpty) {
      return getTranslated ("required", CustomNavigator.scaffoldState.currentContext!);
    } else if (value.length < 8) {
      return  getTranslated ("wrong_phone_number", CustomNavigator.scaffoldState.currentContext!);
    } else {
      return null;
    }
  }

  static String? password(String? value) {
    if (value!.isEmpty) {
      return  getTranslated ("required", CustomNavigator.scaffoldState.currentContext!);
    } else if (value.length < 6) {
      return getTranslated ("6_characters_minimum",  CustomNavigator.scaffoldState.currentContext!);
    } else {
      return null;
    }
  }

  static String? code(String? value) {
    if ( value == null||value.isEmpty) {
      return '';
    } else if (value.length < 4) {
      return "Enter Valid Code";
    } else {
      return null;
    }
  }

  static String? name(
    String? value,
  ) {
    if (value!.isEmpty) {
      return  getTranslated ("required", CustomNavigator.scaffoldState.currentContext!);
    } else if (value.isEmpty) {
      return getTranslated ( "must_be_more_than_one_character",  CustomNavigator.scaffoldState.currentContext!);
    } else {
      return null;
    }
  }
}
