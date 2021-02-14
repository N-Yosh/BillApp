import 'package:bill_app/bill_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'bill.dart';

class CreateBill extends StatelessWidget {
  final _personTextController = TextEditingController();
  final _moneyTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          child: Column(
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
                  var newBill = new Bill(personText, int.parse(moneyText));
                  Navigator.of(context).pop(newBill);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
