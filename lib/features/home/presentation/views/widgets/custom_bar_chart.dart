import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ExpenseChartWidget extends StatelessWidget {
  final List<Expense> expenses;

  ExpenseChartWidget({required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          final expense = expenses[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(expense.icon),
              title: Text(expense.title),
              subtitle: Text(
                  '${expense.transactions} transactions - \$${expense.price.toStringAsFixed(2)}'),
              trailing: SizedBox(
                width: 150, // Adjust as needed
                child: BarChart(
                  BarChartData(
                    titlesData: FlTitlesData(
                      leftTitles: SideTitles(showTitles: false),
                      bottomTitles: SideTitles(showTitles: false),
                    ),
                    borderData: FlBorderData(show: false),
                    barGroups: [
                      BarChartGroupData(
                        x: 0,
                        barRods: [
                          BarChartRodData(
                            y: expense.percentage,
                            colors: [expense.color],
                            width: 15,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Expense {
  final IconData icon;
  final String title;
  final double percentage;
  final Color color;
  final int transactions;
  final double price;

  Expense({
    required this.icon,
    required this.title,
    required this.percentage,
    required this.color,
    required this.transactions,
    required this.price,
  });
}
