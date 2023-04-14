import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:transactions/widgets/new_transaction.dart';
import 'package:transactions/widgets/user_transactions.dart';
import './models/Transaction.dart';
import './widgets/chart.dart';
import './widgets/transaction_data.dart';

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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Colors
  final amber = Colors.amberAccent[200];

  final amber_light = Colors.amberAccent[100];

  final List<Transaction> _trans = transactions;

  List<Transaction> get _recentTrans {
    return _trans.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addTrans(String title, double amount, DateTime date) {
    final tx = Transaction(_trans.length, title, amount, date);
    setState(() {
      _trans.add(tx);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addTrans),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            iconSize: 30,
            color: amber,
            icon: const Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
        title: Center(
          child: Text(
            'حاسبة المصاريف',
            style: TextStyle(
                color: amber,
                fontSize: 30,
                fontFamily: "arabic",
                fontWeight: FontWeight.w900),
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
                child: Chart(_recentTrans),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2 + 75,
              ),
              color: amber_light,
            ),
            UserTransactions()
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: amber,
          size: 30,
        ),
        onPressed: () => _startAddNewTransaction(context),
        backgroundColor: Colors.purple[400],
      ),
    );
  }
}
