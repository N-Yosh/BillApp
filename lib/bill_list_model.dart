import 'package:flutter/material.dart';
import 'bill.dart';

class BillListModel extends ChangeNotifier {
  List<Bill> bills = [];

  void addBill(Bill newBill) {
    bills.add(newBill);
    notifyListeners();
  }
}
