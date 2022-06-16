import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:section_4_practice/models/transaction.dart';
import 'package:section_4_practice/widgets/chart_bar.dart';


class Chart extends StatelessWidget {
  int daysInChart = 7;
  List<Transaction> recentTransaction;
  Chart(this.recentTransaction);


  double get totalSpent {
    return recentTransaction.fold(
        0.0,
        (previousValue, element) => previousValue + element.amount
    );
  }

  List<Map> get spendingByWeekDay {
    var today = DateTime.now();
    List<Map> result = [];
    for (var i=0; i<daysInChart; i++) {
      var selectedDate = today.subtract(Duration(days: i));
      // String weekDay = DateFormat.E().format();
      double spentOnThisDay = recentTransaction.where(
        (element) => (
            element.date.year == selectedDate.year &&
            element.date.month == selectedDate.month &&
            element.date.day == selectedDate.day
        )
      ).fold(
          0.0,
          (previousValue, element) => previousValue + element.amount
      );
      result.add({
        'day': DateFormat.E().format(selectedDate),
        'spent': spentOnThisDay,
      });
    }
    return result;
  }

  List<ChartBar> get chartBars {
    return spendingByWeekDay.map(
      (e) => ChartBar(e['spent'], totalSpent, e['day'])
    ).toList().reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: chartBars,
        ),
      )

    );
  }
}
