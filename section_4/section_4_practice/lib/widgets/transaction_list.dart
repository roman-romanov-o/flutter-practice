import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';


class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth =MediaQuery.of(context).size.width;

    return Container(
      height: deviceHeight * 0.6,
      width: deviceWidth,
      child: transactions.isEmpty ? Column(
        children: [
          Text('There is not transactions yet!'),
          Container(
            height: deviceHeight * 0.3,
            width: deviceWidth * 0.6,
            child: Image.asset('assets/icons/horrible.png', fit: BoxFit.fill,),
          ),
        ],
      ) : ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                    padding: EdgeInsets.all(5),
                    child: FittedBox(
                      child: Text("\$${transactions[index].amount}"),
                    )
                ),
              ),
              title: Text(transactions[index].title.toString()),
              subtitle: Text(
                  DateFormat('yyyy-MM-dd – kk:mm')
                  .format(transactions[index].date)
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTransaction(transactions[index].id),
              ),
            ),
          );
        },
        itemCount: transactions.length,
      )
      ,);

  }
}
