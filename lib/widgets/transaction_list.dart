import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import '../models/Transaction.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> trans;
  TransactionList(this.trans);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  //Colors
  final amber = Colors.amberAccent[200];

  final amber_light = Colors.amberAccent[100];

  void _deleteTrans(id) {
    setState(() {
      widget.trans.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.trans.isEmpty
          ? [
              Text(
                "Empty",
                style: TextStyle(fontSize: 30),
              ),
              Image.asset(
                "assets/images/empty.png",
                fit: BoxFit.cover,
                scale: 0.6,
              )
            ]
          : widget.trans
              .map((e) => Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 8,
                    child: Card(
                      child: Row(
                        children: [
                          Container(
                            color: Colors.purple,
                            alignment: Alignment.center,
                            child: Text(
                              "${e.amount.toStringAsFixed(2)} ₪",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: amber,
                              ),
                            ),
                            width: 80,
                            height: 90,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
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
                                  "${e.date.day}/${e.date.month}/${e.date.year}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 204, 116, 0)),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  onPressed: () {
                                    _deleteTrans(e.id);
                                  },
                                  icon: Icon(Icons.delete),
                                  color: Color.fromARGB(213, 255, 17, 0),
                                )),
                          )
                        ],
                      ),
                      color: amber,
                    ),
                  ))
              .toList(),
    );
  }
}
