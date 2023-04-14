import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import './user_transactions.dart';

class NewTransaction extends StatefulWidget {
  final Function addTrans;
  NewTransaction(this.addTrans);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final amber = Colors.amberAccent[200];

  final amber_light = Colors.amberAccent[100];

  final title_controller = TextEditingController();

  final amount_controller = TextEditingController();
  DateTime? _selectedDate;
  String? _dateString = "No Date Chosen";

  void submitData() {
    final enteredTitle = title_controller.text;
    final enteredAmount = double.parse(amount_controller.text);
    if (enteredAmount <= 0 || enteredTitle.isEmpty || _selectedDate == null) {
      return;
    }
    widget.addTrans(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) return;
      this._selectedDate = date;
      setState(() {
        this._dateString = "${date.year}-${date.month}-${date.day}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Color.fromARGB(255, 255, 232, 162),
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
        child: Column(children: [
          TextField(
            controller: title_controller,
            decoration: InputDecoration(labelText: "What you bought?"),
            style: TextStyle(color: Colors.purple, fontSize: 20),
            onSubmitted: (_) => submitData,
          ),
          TextField(
            controller: amount_controller,
            decoration: InputDecoration(labelText: "Price"),
            style: TextStyle(color: Colors.purple, fontSize: 20),
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData,
          ),
          Container(
            height: 70,
            child: Row(
              children: [
                Text(
                  this._dateString.toString(),
                  style: TextStyle(color: Colors.black54, fontSize: 20),
                ),
                TextButton(
                  onPressed: () {
                    _presentDatePicker();
                  },
                  child: Text(
                    "Choose Date",
                    style: TextStyle(fontSize: 16, color: Colors.purple),
                  ),
                  style: ButtonStyle(
                    alignment: Alignment.center,
                  ),
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: submitData,
            child: Text(
              "Add",
              style: TextStyle(
                  color: amber, fontWeight: FontWeight.w900, fontSize: 20),
            ),
            style:
                ElevatedButton.styleFrom(backgroundColor: Colors.purple[400]),
          ),
        ]),
      ),
    );
  }
}
