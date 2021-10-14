import 'package:flutter/material.dart';
import './models/transaction.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() {
    // TODO: implement createState
    return _TransactionListState();
  }
}

class _TransactionListState extends State<TransactionList> {
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
      children: _userTransactions.map(
        (t) {
          return Card(child: Row(
            children: [
              Container(
                child: Text(t.amount.toString()),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.deepOrange
                  )
                ),
                margin: EdgeInsets.all(10.00),
                padding: EdgeInsets.all(10),
              ),
              Column(
                children: [
                  Container(
                    child: Text(
                      t.title.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    margin: EdgeInsets.only(left: 10),
                  ),
                  Container(
                    child: Text(t.date.toString()),
                    margin: EdgeInsets.only(left: 10),
                  ),
                ],
              )
            ],
          ));
        }
      ).toList(),
    );

  }
}