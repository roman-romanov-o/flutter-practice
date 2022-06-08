import 'package:flutter/material.dart';
import 'package:section_4_practice/models/transaction.dart';
import 'package:section_4_practice/widgets/add_transaction.dart';
import 'package:section_4_practice/widgets/transaction_list.dart';


class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1',
        title: 'test 1',
        date: DateTime.now(),
        amount: 20.10
    ),
    Transaction(
        id: 't2',
        title: 'test 2',
        date: DateTime.now(),
        amount: 20.10
    ),
  ];

  addTransaction(String title, double amount) {
    setState(() {
      transactions.add(
          Transaction(
              id: 'test',
              title: title,
              amount: amount,
              date: DateTime.now()
          )
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AddTransaction(addTransaction),
          TransactionList(transactions),
        ],
      ),
    );
  }
}
