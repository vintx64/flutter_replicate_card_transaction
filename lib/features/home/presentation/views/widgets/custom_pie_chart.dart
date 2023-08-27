import 'dart:math';
import 'package:flutter/material.dart';

class ExpenseData {
  final String name;
  final double percentage;
  final Color color;

  ExpenseData(this.name, this.percentage, this.color);
}

class ExpenseRepository {
  List<ExpenseData> getExpenses() {
    return [
      ExpenseData('Shopping', 0.5, const Color.fromRGBO(192, 192, 222, 1)),
      ExpenseData('Wellness', 0.25, const Color.fromRGBO(160, 210, 193, 1)),
      ExpenseData('Transport', 0.125, const Color.fromRGBO(255, 176, 182, 1)),
      ExpenseData(
          'Subscriptions', 0.185, const Color.fromRGBO(142, 155, 197, 1)),
      ExpenseData(
          'Bars & Restaurants', 0.0625, const Color.fromRGBO(255, 194, 165, 1)),
    ];
  }
}

class CustomPieChart extends StatefulWidget {
  @override
  _CustomPieChartState createState() => _CustomPieChartState();
}

class _CustomPieChartState extends State<CustomPieChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;
  late Animation<double> _textOpacityAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _rotationAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _textOpacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.6, 1.0),
      ),
    );

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final mockDataList = ExpenseRepository().getExpenses();
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return PieChartWidget(
          expenseDataList: mockDataList,
          rotation: _rotationAnimation.value * 360.0,
          textOpacity: _textOpacityAnimation.value,
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class PieChartWidget extends StatelessWidget {
  final List<ExpenseData> expenseDataList;
  final double rotation;
  final double textOpacity;

  const PieChartWidget({
    required this.expenseDataList,
    required this.rotation,
    required this.textOpacity,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PieChartPainter(
        expenseDataList: expenseDataList,
        rotation: rotation,
        textOpacity: textOpacity,
      ),
      child: Container(),
    );
  }
}

class PieChartPainter extends CustomPainter {
  final List<ExpenseData> expenseDataList;
  final double rotation;
  final double textOpacity;
  final double gapSize = 6; // Adjust the gap size between arcs

  PieChartPainter({
    required this.expenseDataList,
    required this.rotation,
    required this.textOpacity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2.0, size.height / 2.0);
    final radius = size.width * 0.9;
    final rect = Rect.fromCircle(center: center, radius: radius);

    var totalPercentage =
        expenseDataList.fold(0.0, (sum, data) => sum + data.percentage);
    var totalAngle = 360.0;
    var gapCount = expenseDataList.length;
    var totalGapSize = gapCount * gapSize;
    var remainingAngle = totalAngle - totalGapSize;
    var gapAngle = gapSize * pi / 180.0;

    var startAngle = (-pi / 2.0) + (rotation * pi / 180.0);

    for (var data in expenseDataList) {
      var normalizedPercentage = data.percentage / totalPercentage;
      var sweepAngle = normalizedPercentage * remainingAngle * pi / 180.0;

      final paint = Paint()
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8
        ..color = data.color;

      canvas.drawArc(rect, startAngle, sweepAngle, false, paint);

      startAngle += sweepAngle + gapAngle;
    }

    final textPainter1 = TextPainter(
      text: TextSpan(
        text: 'Total Spent',
        style: TextStyle(
          fontSize: 22,
          color: Colors.black.withOpacity(0.2 * textOpacity),
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter1.layout();

    final textPainter2 = TextPainter(
      text: TextSpan(
        text: '\$9,000.00',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black.withOpacity(textOpacity),
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter2.layout();

    final text1Offset = Offset(
      center.dx - textPainter1.width / 2,
      center.dy - textPainter1.height - 8,
    );
    textPainter1.paint(canvas, text1Offset);

    final text2Offset = Offset(
      center.dx - textPainter2.width / 2,
      center.dy - 8,
    );
    textPainter2.paint(canvas, text2Offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
