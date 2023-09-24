import 'package:flutter/cupertino.dart';

class AddRequestProvider extends ChangeNotifier{
  Object? selectedLoanType;
  List<String>loanTypes=[];
onSelectLoanType(v){
  selectedLoanType =v;
  notifyListeners();
}

onSubmit(){}

}