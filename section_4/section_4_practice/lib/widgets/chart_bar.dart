import 'package:flutter/material.dart';


class ChartBar extends StatelessWidget {
  double spendAmount;
  double totalSpendAmount;
  String weekDay;
  ChartBar(this.spendAmount, this.totalSpendAmount, this.weekDay);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          Container(
            width: 25,
            height: 25,
            child: FittedBox(
              child: Text('\$${spendAmount.toStringAsFixed(0)}'),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 60,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: FractionallySizedBox(
                    alignment: Alignment.center,
                    heightFactor: (
                        totalSpendAmount > 0.0 ?
                        spendAmount / totalSpendAmount : 0.0
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(weekDay),
        ],
      ),
    );
  }
}