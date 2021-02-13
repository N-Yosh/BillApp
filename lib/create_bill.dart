import 'package:bill_app/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bill.dart';

class CreateBill extends StatelessWidget {
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
                      decoration: InputDecoration(labelText: '請求金額'),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              FloatingActionButton(child: Text('Create'), onPressed: () {
                var newBill=new Bill();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
