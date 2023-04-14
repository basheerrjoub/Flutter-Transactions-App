import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:transactions/models/Transaction.dart';
import 'package:transactions/widgets/chart_bar.dart';

class Chart extends StatefulWidget {
  final List<Transaction> recentTransactions;

  Chart(@required this.recentTransactions);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      List<String> days = ["M", "T", "W", "R", "F", "S", "U"];
      double sumTrans = 0;
      for (int i = 0; i < widget.recentTransactions.length; i++) {
        if (widget.recentTransactions[i].date.day == weekDay.day) {
          sumTrans += widget.recentTransactions[i].amount;
        }
      }
      return {
        "day": days[weekDay.weekday - 1],
        "amount": sumTrans.toStringAsFixed(2)
      };
    });
  }

  double get maxSpending {
    return groupedTransactionValues.fold(0, (sum, element) {
      return sum + double.parse(element["amount"].toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransactionValues.map((e) {
          return ChartBar(
              e["day"].toString(),
              double.parse(e["amount"].toString()),
              maxSpending == 0
                  ? 0
                  : double.parse(e["amount"].toString()) / maxSpending);
        }).toList(),
      ),
    );
  }
}
