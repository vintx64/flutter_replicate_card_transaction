import 'package:flutter/material.dart';
import 'package:flutter_replicate_card_transaction/features/home/presentation/views/widgets/custom_bar_chart.dart';
import 'package:flutter_replicate_card_transaction/features/home/presentation/views/widgets/custom_pie_chart.dart';
import 'package:flutter_replicate_card_transaction/features/home/presentation/views/widgets/custom_tab_bar.dart';

import 'month_scroll.dart';

class ExpensesViewBody extends StatelessWidget {
  const ExpensesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTabBar(),
        Padding(
          padding: EdgeInsets.only(top: 90, bottom: 90),
          child: SizedBox(
            height: 160,
            width: 160,
            child: CustomPieChart(),
          ),
        ),
        SizedBox(
          height: 40,
          width: 350,
          child: MonthScroll(),
        ),
        ExpenseChartWidget(
          expenses: [
            Expense(
              icon: Icons.shopping_cart,
              title: 'Shopping',
              percentage: 55.0, // Customize percentage
              color: Colors.blue,
              transactions: 50, // Customize transactions count
              price: 500.0, // Customize price
            ),
            Expense(
              icon: Icons.favorite,
              title: 'Wellness',
              percentage: 0.08, // Customize percentage
              color: Colors.green,
              transactions: 30, // Customize transactions count
              price: 300.0, // Customize price
            ),
          ],
        ),
      ],
    );
  }
}
