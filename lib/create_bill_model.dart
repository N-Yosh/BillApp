import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateBillModel extends ChangeNotifier {

  void writeOccurrenceDay(){
    notifyListeners();
  }

  void writePaymentDay(){
    notifyListeners();
  }

  String dateConverterToString(DateTime date){
    DateFormat outputFormat = DateFormat('yyyy-MM-dd');
    return outputFormat.format(date);
  }
}
