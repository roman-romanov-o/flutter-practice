import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  TransactionList(this._userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView(
        children: _userTransactions.map(
                (t) {
              return Card(
                  child: Row(
                    children: [
                      Container(
                        child: Text(t.amount.toString()),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.deepPurpleAccent
                            )
                        ),
                        margin: EdgeInsets.all(10.00),
                        padding: EdgeInsets.all(12),
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
      )
    );


  }
}
