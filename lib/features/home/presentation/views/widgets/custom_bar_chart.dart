import 'package:flutter/material.dart';
import 'package:flutter_replicate_card_transaction/constants.dart';

class ExpenseChartWidget extends StatelessWidget {
  final List<Expense> expenses;

  const ExpenseChartWidget({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          final expense = expenses[index];
          return Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 12),
            child: CustomPaint(
              painter: ExpensePainter(expense.percentage, expense.color),
              child: SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 5),
                      child: Icon(expense.icon),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 15),
                          child: Text(
                            expense.title,
                            style: const TextStyle(
                                fontFamily: kLatoBold, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6, left: 15),
                          child: Text(
                            '${expense.transactions} Transactions',
                            style: TextStyle(
                                fontFamily: kLatoRegular,
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.5)),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(
                            '\$${expense.price.toStringAsFixed(2)}',
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                fontFamily: kLatoBold, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Text(
                            '${expense.percentage.toStringAsFixed(2).replaceAll('.00', ' ')}%',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontFamily: kLatoRegular,
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.5)),
                          ),
                        ),
                      ],
                    ),
                  ],
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

class ExpensePainter extends CustomPainter {
  final double fillPercentage;
  final Color color;

  ExpensePainter(this.fillPercentage, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final rect = Rect.fromPoints(
      const Offset(0, 0),
      Offset(size.width * fillPercentage / 100, size.height), // Divide by 100
    );
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
