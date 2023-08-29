import 'package:flutter/material.dart';
import 'package:flutter_replicate_card_transaction/features/home/presentation/views/widgets/custom_pie_chart.dart';
import 'package:flutter_replicate_card_transaction/features/home/presentation/views/widgets/custom_tab_bar.dart';

import 'month_scroll.dart';

class ExpensesViewBody extends StatelessWidget {
  const ExpensesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTabBar(),
        Padding(
          padding: EdgeInsets.only(top: 90),
          child: SizedBox(
            height: 160,
            width: 160,
            child: CustomPieChart(),
          ),
        ),
        MonthScroll(),
      ],
    );
  }
}
