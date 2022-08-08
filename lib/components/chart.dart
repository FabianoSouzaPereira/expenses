import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  // ignore: use_key_in_widget_constructors
  const Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedtransations {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        bool sameDay = recentTransaction[i].date.day == weekDay.day;
        bool sameMonth = recentTransaction[i].date.month == weekDay.month;
        bool sameYear = recentTransaction[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransaction[i].value;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  double get _weekTotalValue {
    return groupedtransations.fold(0.0, (sum, tr) {
      return sum + (tr['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedtransations.map((tr) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  label: tr['day'].toString(),
                  value: double.parse(tr['value'].toString()).toDouble(),
                  percentage: (tr['value'] as double) / _weekTotalValue,
                ),
              );
            }).toList(),
          ),
        ));
  }
}
