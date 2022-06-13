import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  final Function addTxMethod;
  AddTransaction(this.addTxMethod);

  @override
  State<AddTransaction> createState() => _AddTransactionState(addTxMethod);
}

class _AddTransactionState extends State<AddTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
          onTap: () => print(titleController.text),
          onChanged: (value) {
            print('TEST');
          },
          // keyboardType: TextInputType.number,
        ),
        TextButton(
            onPressed: () {
              widget.addTxMethod(
                  titleController.text,
                  double.parse(amountController.text)
              );
              titleController.clear();
              amountController.clear();
            },
            child: Text('Add new transaction')
        ),
      ],),
    );
  }

}
