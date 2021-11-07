import 'package:flutter/material.dart';

class AddNewTransaction extends StatefulWidget {
  final Function addNewTx;

  AddNewTransaction(this.addNewTx);

  @override
  _AddNewTransactionState createState() => _AddNewTransactionState();
}

class _AddNewTransactionState extends State<AddNewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: 'Amount of transaction'
          ),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              textStyle: TextStyle(fontSize: 15),
            ),
            onPressed: () => {
              widget.addNewTx(
                titleController.text,
                double.parse(amountController.text),
              ),
              Navigator.of(context).pop()
            },
            child: Text('Add transaction')
        )
      ],
    ),
    );
  }
}
