import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:transactions/widgets/user_transactions.dart';
import './models/Transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transactions',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  //Colors
  final amber = Colors.amberAccent[200];
  final amber_light = Colors.amberAccent[100];

  final title_controller = TextEditingController();
  final amount_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Center(
          child: Text(
            'حاسبة المصاريف',
            style: TextStyle(
                color: amber, fontSize: 30, fontWeight: FontWeight.w900),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Container(
                child: Center(
                    child: Text('Transactions Chart',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.purple,
                        ))),
                width: double.infinity,
                height: 50,
              ),
              color: amber_light,
            ),
            UserTransactions()
          ],
        ),
      ),
    );
  }
}
