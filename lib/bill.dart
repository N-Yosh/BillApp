import 'dart:core';

class Bill {
  //コンストラクタ
  Bill(this.person,this.money){
    createdDay=DateTime.now();
  }

  //変数
  String person;
  double money;
  DateTime createdDay;

  DateTime occurrenceDay;
  DateTime paymentDay;
  String memo;

  bool collectionCompleted = false;
  DateTime collectedDay;
}
