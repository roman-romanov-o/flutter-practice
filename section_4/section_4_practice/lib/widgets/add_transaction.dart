import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  final Function addTxMethod;
  AddTransaction(this.addTxMethod);

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime selectedDate = null;

  void chooseDate() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 90)),
        lastDate: DateTime.now(),
    ).then(
      (value) {
        if (value == null) {
          return;
        }
        setState(() {
          selectedDate = value;
        });
      }
    );
  }

  void submitData(String title, double amount, DateTime date) {
    if (
      title == null ||
      amount == null ||
      date == null
    ) {
      return;
    }
    widget.addTxMethod(
        titleController.text,
        double.parse(amountController.text),
        date,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Column(children: [
        TextField(
          controller: titleController,
          decoration: InputDecoration(
              labelText: 'Title for your transaction'
          ),
        ),
        TextField(
          controller: amountController,
          decoration: InputDecoration(
              labelText: 'Amount of money'
          ),
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          // keyboardType: TextInputType.number,
        ),
        Row(
          children: [
            Container(
              child: Text(
                  selectedDate == null ?
                  'No date selected!':
                  'Selected date ${DateFormat.yMd().format(selectedDate)}'
              ),
            ),
            TextButton(onPressed: chooseDate, child: Text('Choose date'))
          ],
        ),
        TextButton(
            onPressed: () => submitData(
                titleController.text,
                double.parse(amountController.text),
                selectedDate,
            ),
            child: Text(
              'Add new transaction',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
        ),
      ],),
    );
  }

}
