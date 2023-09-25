import 'package:flutter/cupertino.dart';

class AddRequestProvider extends ChangeNotifier {
  Object? selectedLoanType;
  List<String> loanTypes = ["frfr", "rg4g", "ef"];
  onSelectLoanType(v) {
    selectedLoanType = v;
    notifyListeners();
  }

  onSubmit() {}
}
