import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_replicate_card_transaction/constants.dart';
import 'package:flutter_replicate_card_transaction/features/home/presentation/views/expenses_view.dart';

void main() {
  runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: kPrimaryColor, // Set your desired app bar color here
    ));
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpensesView(),
    );
  }
}
