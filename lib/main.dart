import 'package:bill_app/main_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bill App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<MainModel>(
        create: (context) => MainModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Billing list'),
          ),
          body: Consumer<MainModel>(
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
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              //todo
            },
            child: Icon(Icons.add),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text('Setting'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Search'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
