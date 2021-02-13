import 'package:bill_app/create_bill.dart';
import 'package:bill_app/home_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeModel>(
      create: (context) => HomeModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Billing list'),
          actions: [
            IconButton(icon: Icon(Icons.add),onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateBill()),
              );
            },)
          ],
        ),
        body: Consumer<HomeModel>(
          builder: (context, model, child) {

            final listTiles = model.bills
                .map(
                  (e) => ListTile(
                    leading: Text('￥' + e.money.toString()),
                    title: Text(e.person),
                    subtitle: Text('支払予定 ' + e.paymentDay.toString()),
                  ),
                )
                .toList();

            return Container(
              color: Colors.grey[300],
              child: ListView(
                children: listTiles,
              ),
            );
          },
        ),
      ),
    );
  }
}
