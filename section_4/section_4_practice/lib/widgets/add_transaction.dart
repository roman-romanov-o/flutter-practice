import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addTxMethod;
  AddTransaction(this.addTxMethod);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Column(children: [
        TextField(
          controller: titleController,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Title for your transaction'
          ),
        ),
        TextField(
          controller: amountController,
          decoration: InputDecoration(
            labelText: 'Amount of money'
          ),
          keyboardType: TextInputType.number,
        ),
        TextButton(
            onPressed: () => addTxMethod(
                titleController.text,
                double.parse(amountController.text)
            ),
            child: Text('Add new transaction')
        ),
      ],),
    );
  }
}
