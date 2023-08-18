import 'package:flutter/material.dart';
import 'package:flutter_replicate_card_transaction/features/home/presentation/views/widgets/expenses_view_body.dart';

import 'widgets/custom_app_bar.dart';

class ExpensesView extends StatelessWidget {
  const ExpensesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'Expenses',
      ),
      body: const ExpensesViewBody(),
    );
  }
}
