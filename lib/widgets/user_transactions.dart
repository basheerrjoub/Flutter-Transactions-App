import 'dart:math';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/Transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _trans = [
    Transaction(1, "Buy ticket", 4.99, DateTime.now()),
    Transaction(2, "Buy Milk", 9.99, DateTime.now()),
    Transaction(3, "Register ChatGPT", 20.0, DateTime.now()),
  ];
  void _addTrans(String title, double amount) {
    final tx = Transaction(_trans.length, title, amount, DateTime.now());
    setState(() {
      _trans.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [NewTransaction(this._addTrans), TransactionList(this._trans)],
    );
  }
}
