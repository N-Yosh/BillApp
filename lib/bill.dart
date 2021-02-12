import 'dart:core';

class Bill {
  bill(String personName, double money, DateTime occurrenceDay,
      DateTime paymentDay) {
    this.person = personName;
    this.money = money;
    this.occurrenceDay = occurrenceDay;
    this.paymentDay = paymentDay;
    this.createdDay = DateTime.now();
  }

  String person;
  double money;
  DateTime createdDay;

  DateTime occurrenceDay;
  DateTime paymentDay;

  bool collectionCompleted = false;
  DateTime collectedDay;
}
