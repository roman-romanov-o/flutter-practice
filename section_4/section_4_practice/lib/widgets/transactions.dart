import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './add_transaction.dart';
import './transaction_list.dart';

var uuid = Uuid();

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  void _addNewTransaction(String title, double amount) {
    setState(() {
      _userTransactions.add(Transaction(
        id: uuid.v1(),
        title: title,
        amount: amount,
        date: DateTime.now(),
      ));
    });
  }

  final List<Transaction> _userTransactions = [
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


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddNewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
