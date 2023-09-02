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
        const CustomTabBar(),
        const Padding(
          padding: EdgeInsets.only(top: 90, bottom: 90),
          child: SizedBox(
            height: 160,
            width: 160,
            child: CustomPieChart(),
          ),
        ),
        const SizedBox(
          height: 40,
          width: 350,
          child: MonthScroll(),
        ),
        ExpenseChartWidget(
          expenses: [
            Expense(
              icon: Icons.shopping_bag_outlined,
              title: 'Shopping',
              percentage: 50,
              color: const Color.fromRGBO(227, 230, 241, 1),
              transactions: 73,
              price: 3500.0,
            ),
            Expense(
              icon: Icons.favorite_border_outlined,
              title: 'Wellness',
              percentage: 25,
              color: const Color.fromRGBO(231, 244, 239, 1),
              transactions: 73,
              price: 1750.0,
            ),
            Expense(
              icon: Icons.airplanemode_active_outlined,
              title: 'Transport',
              percentage: 12.5,
              color: const Color.fromRGBO(255, 235, 237, 1),
              transactions: 73,
              price: 875.0,
            ),
            Expense(
              icon: Icons.restaurant_outlined,
              title: 'Bars & Resturant',
              percentage: 6.25,
              color: const Color.fromRGBO(255, 240, 233, 1),
              transactions: 73,
              price: 437.50,
            ),
            Expense(
              icon: Icons.new_releases_outlined,
              title: 'Subscriptions',
              percentage: 18.5,
              color: const Color.fromRGBO(239, 239, 247, 1),
              transactions: 73,
              price: 4186.0,
            ),
          ],
        ),
      ],
    );
  }
}
