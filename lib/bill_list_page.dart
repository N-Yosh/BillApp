import 'package:bill_app/create_bill_page.dart';
import 'package:bill_app/bill_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class BillList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BillListModel>(
      create: (context) => BillListModel(),
      child: Consumer<BillListModel>(
        builder: (context, model, child) {
          final listTiles = model.bills
              .map(
                (e) => Container(
                  padding: EdgeInsets.all(3),
                  child: ListTile(
                    tileColor: Colors.white,
                    onLongPress: () {
                      model.removeBill(e);
                    },
                    leading: Text(
                      '￥' + e.money.toString(),
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    title: Text(e.person),
                    subtitle: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("memo"),
                          Text('支払予定 ' + model.dateConverterToString(e.createdDay)),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Billing list'),
            ),
            body: Container(
              color: Colors.grey[300],
              child: ListView(
                children: listTiles,
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                var newBill = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateBill()),
                );
                if (newBill == null) return;
                model.addBill(newBill);
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
