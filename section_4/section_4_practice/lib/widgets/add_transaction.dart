import 'package:flutter/material.dart';

class AddNewTransaction extends StatelessWidget {
  final Function addNewTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  AddNewTransaction(this.addNewTx);
  @override
  Widget build(BuildContext context) {
    return Card(child: Column(
      children: [
        TextField(
            controller: titleController,
            decoration: InputDecoration(
            labelText: 'Title of transaction',
            labelStyle: TextStyle(color: Colors.grey)
        ),),
        TextField(
          controller: amountController,
          decoration: InputDecoration(
              labelText: 'Amount of transaction'
          ),
        ),
        TextButton(
            style: TextButton.styleFrom(
              textStyle: TextStyle(fontSize: 25),
              primary: Colors.deepOrange,
              shadowColor: Colors.purple,
            ),
            onPressed: () => addNewTx(
              titleController.text,
              double.parse(amountController.text),
            ),
            child: Text('Add transaction')
        )
      ],
    ),
    );
  }
}
