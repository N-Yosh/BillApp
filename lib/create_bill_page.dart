import 'dart:ui';
import 'package:bill_app/create_bill_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'bill.dart';

class CreateBill extends StatelessWidget {
  final _personTextController = TextEditingController();
  final _moneyTextController = TextEditingController();
  final _memoTextController = TextEditingController();
  String occurrenceDayText = "請求発生日";
  Color occurrenceDayTextColor = Colors.grey;
  String paymentDayText = "回収予定日";
  Color paymentDayTextColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CreateBillModel>(
      create: (context) => CreateBillModel(),
      child: Consumer<CreateBillModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Create bill'),
            ),
            body: Container(
              color: Colors.grey,
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.account_circle),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                        ),
                        Flexible(
                          child: TextFormField(
                            controller: _personTextController,
                            decoration: InputDecoration(labelText: '請求相手'),
                            maxLength: 30,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.monetization_on),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                        ),
                        Flexible(
                          child: TextFormField(
                            controller: _moneyTextController,
                            decoration: InputDecoration(labelText: '請求金額'),
                            maxLength: 10,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    FloatingActionButton(
                      child: Text('Submit'),
                      onPressed: () {
                        var personText = _personTextController.text;
                        var moneyText = _moneyTextController.text;
                        if (personText == "" || moneyText == "") {
                          //メッセージホップアップ
                          return;
                        }
                        //作成した請求書を渡す
                        var newBill =
                            new Bill(personText, int.parse(moneyText));
                        Navigator.of(context).pop(newBill);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Text(
                          '詳細項目',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[800],
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          '請求発生日 ：',
                          style: TextStyle(fontSize: 20),
                        ),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        FlatButton(
                          child: Text(
                            occurrenceDayText,
                            style: TextStyle(
                                fontSize: 20, color: occurrenceDayTextColor),
                          ),
                          onPressed: () async {
                            final DateTime day = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(DateTime.now().year - 5),
                              lastDate: DateTime(DateTime.now().year + 5),
                            );
                            if (day != null) {
                              occurrenceDayText =
                                  model.dateConverterToString(day);
                              occurrenceDayTextColor = Colors.black;
                              model.writeOccurrenceDay();
                            }
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          '回収予定日 ：',
                          style: TextStyle(fontSize: 20),
                        ),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        FlatButton(
                          child: Text(
                            paymentDayText,
                            style: TextStyle(
                                fontSize: 20, color: paymentDayTextColor),
                          ),
                          onPressed: () async {
                            final DateTime day = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(DateTime.now().year - 5),
                              lastDate: DateTime(DateTime.now().year + 5),
                            );
                            if (day != null) {
                              paymentDayText =
                                  model.dateConverterToString(day);
                              paymentDayTextColor = Colors.black;
                              model.writePaymentDay();
                            }
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          "メモ ：",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Flexible(
                          child: TextField(
                            decoration: InputDecoration(hintText: "請求内容等…"),
                            controller: _memoTextController,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                    ),
                    FlatButton(
                      child: Text(
                        "キャンセル",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(null);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
