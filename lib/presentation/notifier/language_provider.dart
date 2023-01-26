import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../app/core/utils/app_storage_keys.dart';


class LanguageProvider with ChangeNotifier {

  int _selectIndex = 0;

  int get selectIndex => _selectIndex;

  void setSelectIndex(int index) {
    _selectIndex = index;
    notifyListeners();
  }

  List<LanguageModel> _languages = [];

  List<LanguageModel> get languages => _languages;


  void initializeAllLanguages(BuildContext context) {
    if (_languages.isEmpty) {
      // _languages.clear();
      _languages = AppStorageKey.languages;
      notifyListeners();
    }
  }
}

class LanguageModel {
  String ?  imageUrl;
  String? languageName;
  String? languageCode;
  String? countryCode;

  LanguageModel({this.imageUrl, this.languageName, this.countryCode, this.languageCode});
}
