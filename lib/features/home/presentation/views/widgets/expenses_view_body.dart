import 'package:flutter/material.dart';
import 'package:flutter_replicate_card_transaction/features/home/presentation/views/widgets/custom_pie_chart.dart';
import 'package:flutter_replicate_card_transaction/features/home/presentation/views/widgets/custom_tab_bar.dart';

class ExpensesViewBody extends StatelessWidget {
  const ExpensesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTabBar(),
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: SizedBox(
            height: 180,
            width: 180,
            child: CustomPieChart(),
          ),
        ),
      ],
    );
  }
}
