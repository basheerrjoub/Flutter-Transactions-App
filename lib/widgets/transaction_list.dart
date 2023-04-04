import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import '../models/Transaction.dart';

class TransactionList extends StatelessWidget {
  //Colors
  final amber = Colors.amberAccent[200];
  final amber_light = Colors.amberAccent[100];
  final List<Transaction> trans;
  TransactionList(this.trans);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: trans
          .map((e) => Container(
                width: double.infinity,
                height: 70,
                child: Card(
                  child: Row(
                    children: [
                      Container(
                        color: Colors.purple,
                        alignment: Alignment.center,
                        child: Text(
                          "${e.amount} ₪",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: amber,
                          ),
                        ),
                        width: 80,
                        height: 90,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${e.title}",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.purple[700]),
                          ),
                          Text(
                            "${e.date.day}/${e.date.month}/${e.date.year} ${e.date.hour}:${e.date.minute} ${e.date.second} ",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 204, 116, 0)),
                          )
                        ],
                      ),
                    ],
                  ),
                  color: amber,
                ),
              ))
          .toList(),
    );
  }
}
