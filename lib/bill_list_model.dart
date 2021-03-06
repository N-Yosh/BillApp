import 'package:flutter/material.dart';
import 'bill.dart';
import 'package:intl/intl.dart';

class BillListModel extends ChangeNotifier {
  List<Bill> bills = [];

  void addBill(Bill newBill) {
    bills.add(newBill);
    notifyListeners();
  }

  void removeBill(Bill targetBill){
    bills.remove(targetBill);
    notifyListeners();
  }

  String dateConverterToString(DateTime date){
    DateFormat outputFormat = DateFormat('yyyy-MM-dd');
    return outputFormat.format(date);
  }
}
