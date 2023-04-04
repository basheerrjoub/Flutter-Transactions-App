import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import './user_transactions.dart';

class NewTransaction extends StatelessWidget {
  final amber = Colors.amberAccent[200];
  final amber_light = Colors.amberAccent[100];
  final title_controller = TextEditingController();
  final amount_controller = TextEditingController();
  final Function addTrans;
  NewTransaction(this.addTrans);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.purple,
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
        child: Column(children: [
          TextField(
            controller: title_controller,
            decoration: InputDecoration(labelText: "What you bought?"),
            style: TextStyle(color: amber, fontSize: 20),
          ),
          TextField(
            controller: amount_controller,
            decoration: InputDecoration(labelText: "Price"),
            style: TextStyle(color: amber, fontSize: 20),
          ),
          ElevatedButton(
            onPressed: () => {
              addTrans(
                  title_controller.text, double.parse((amount_controller.text)))
            },
            child: Text(
              "Add",
              style: TextStyle(
                  color: Colors.purple[400],
                  fontWeight: FontWeight.w900,
                  fontSize: 20),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: amber),
          )
        ]),
      ),
    );
  }
}
