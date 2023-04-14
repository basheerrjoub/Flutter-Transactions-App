import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatefulWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentagePerTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPercentagePerTotal);

  @override
  State<ChartBar> createState() => _ChartBarState();
}

class _ChartBarState extends State<ChartBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 8,
        ),
        Text("${this.widget.spendingAmount.toStringAsFixed(0)}₪"),
        SizedBox(
          height: 4,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.15,
          width: 15,
          margin: EdgeInsets.only(top: 4),
          child: Stack(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 3),
                      color: Color.fromARGB(255, 236, 130, 255),
                      borderRadius: BorderRadius.circular(10))),
              FractionallySizedBox(
                alignment: Alignment.bottomCenter,
                heightFactor: widget.spendingPercentagePerTotal,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 118, 30, 134),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(this.widget.label),
      ],
    );
  }
}
