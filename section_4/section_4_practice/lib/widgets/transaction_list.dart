import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';



class TransactionList extends StatelessWidget {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  final List<Transaction> _userTransactions;
  TransactionList(this._userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
          itemBuilder: (ctx, index) {
            var transaction = _userTransactions[index];
            return Card(
                child: Row(
                  children: [
                    Container(
                      child: Text(transaction.amount.toString()),
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
                            transaction.title.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          margin: EdgeInsets.only(left: 10),
                        ),
                        Container(
                          child: Text(
                            formatter.format(transaction.date)
                          ),
                          margin: EdgeInsets.only(left: 10),
                        ),
                      ],
                    )
                  ],
                ));
            },
          itemCount: _userTransactions.length,
      )
    );
  }
}
