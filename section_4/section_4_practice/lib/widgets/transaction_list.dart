import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';


class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(child: Row(
              children: [
                Container(
                  child: Text(
                    "\$${transactions[index].amount}"
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Theme.of(context).primaryColorLight,
                      )
                  ),
                  margin: EdgeInsets.all(10.00),
                  padding: EdgeInsets.all(25),
                ),
                Column(
                  children: [
                    Container(
                      child: Text(
                        transactions[index].title.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      margin: EdgeInsets.only(left: 10),
                    ),
                    Container(
                      child: Text(
                        DateFormat('yyyy-MM-dd – kk:mm').format(transactions[index].date)
                      ),
                      margin: EdgeInsets.only(left: 10),
                    ),
                  ],
                )
              ],
            ),
            elevation: 0.7,
            shadowColor: Theme.of(context).primaryColor,
          );
        },
        itemCount: transactions.length,
      )
      ,);

  }
}
