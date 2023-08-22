// import 'dart:math';

// import 'package:flutter/material.dart';

// class MockData {
//   final String expenseName;
//   final double value;
//   final int transactions;
//   final double percentage;
//   final Color color;

//   MockData(this.expenseName, this.value, this.transactions, this.percentage,
//       this.color);
// }

// class CustomPieChart extends StatelessWidget {
//   CustomPieChart({super.key});
//   final List<MockData> mockDataList = [
//     MockData('Shopping', 3500, 73, 0.5, const Color.fromRGBO(192, 192, 222, 1)),
//     MockData(
//         'Wellness', 1750, 73, 0.25, const Color.fromRGBO(160, 210, 193, 1)),
//     MockData(
//         'Transport', 875, 73, 0.125, const Color.fromRGBO(255, 176, 182, 1)),
//     MockData('Bars & Resturants', 437.50, 73, 0.0625,
//         const Color.fromRGBO(255, 194, 165, 1)),
//     MockData('Subscriptions', 4186, 73, 0.185,
//         const Color.fromRGBO(142, 155, 197, 1)),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return PieChartWidget(mockDataList);
//   }
// }

// class PieChartWidget extends StatefulWidget {
//   final List<MockData> mockDataList;

//   const PieChartWidget(this.mockDataList, {super.key});

//   @override
//   State<PieChartWidget> createState() => _PieChartWidgetState();
// }

// class _PieChartWidgetState extends State<PieChartWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: PieChartPainter(widget.mockDataList, 6),
//       child: Container(),
//     );
//   }
// }

// class PieChartPainter extends CustomPainter {
//   final List<MockData> mockDataList;
//   final double gapSize;
//   PieChartPainter(
//     this.mockDataList,
//     this.gapSize,
//   );
//   @override
//   void paint(Canvas canvas, Size size) {
//     final c = Offset(size.width / 2.0, size.height / 2.0);
//     final raidus = size.width * 0.9;
//     final rect = Rect.fromCenter(center: c, width: raidus, height: raidus);
//     var totalPercentage =
//         mockDataList.fold(0.0, (sum, data) => sum + data.percentage);
//     var totalGapSize = gapSize * mockDataList.length;
//     var totalAngle = 360.0 - totalGapSize;
//     var gapAngle = gapSize * pi / 180.0;
//     var startAngle = 0.0;

//     for (var di in mockDataList) {
//       var normalizedPercentage = di.percentage / totalPercentage;
//       var sweepAngle = normalizedPercentage * totalAngle * pi / 180.0;
//       final paint = Paint()
//         ..strokeCap = StrokeCap.round
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = 10
//         ..color = di.color;
//       canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
//       startAngle += sweepAngle + gapAngle;
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }
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
      ExpenseData('Shopping', 0.5, Color.fromRGBO(192, 192, 222, 1)),
      ExpenseData('Wellness', 0.25, Color.fromRGBO(160, 210, 193, 1)),
      ExpenseData('Transport', 0.125, Color.fromRGBO(255, 176, 182, 1)),
      ExpenseData('Subscriptions', 0.185, Color.fromRGBO(142, 155, 197, 1)),
      ExpenseData(
          'Bars & Restaurants', 0.0625, Color.fromRGBO(255, 194, 165, 1)),
    ];
  }
}

class CustomPieChart extends StatelessWidget {
  final ExpenseRepository repository = ExpenseRepository();

  CustomPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    final mockDataList = repository.getExpenses();
    return PieChartWidget(mockDataList, gapSize: 6);
  }
}

class PieChartWidget extends StatelessWidget {
  final List<ExpenseData> expenseDataList;
  final double gapSize;

  const PieChartWidget(this.expenseDataList,
      {super.key, required this.gapSize});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PieChartPainter(expenseDataList, gapSize),
      child: Container(),
    );
  }
}

class PieChartPainter extends CustomPainter {
  final List<ExpenseData> expenseDataList;
  final double gapSize;

  PieChartPainter(this.expenseDataList, this.gapSize);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2.0, size.height / 2.0);
    final radius = size.width * 0.9;
    final rect = Rect.fromCircle(center: center, radius: radius);

    var totalPercentage =
        expenseDataList.fold(0.0, (sum, data) => sum + data.percentage);
    var totalGapSize = gapSize * expenseDataList.length;
    var totalAngle = 360.0 - totalGapSize;
    var gapAngle = gapSize * pi / 180.0;
    var startAngle = -pi / 2.0;

    for (var data in expenseDataList) {
      var normalizedPercentage = data.percentage / totalPercentage;
      var sweepAngle = normalizedPercentage * totalAngle * pi / 180.0;
      final paint = Paint()
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8
        ..color = data.color;
      canvas.drawArc(rect, startAngle, sweepAngle, false, paint);

      startAngle += sweepAngle + gapAngle;
    }
    final textPainter = TextPainter(
      text: TextSpan(
        text: 'Center Text', // Replace with your desired text
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: 0, maxWidth: size.width);
    final textX = center.dx - textPainter.width / 2;
    final textY = center.dy - textPainter.height / 2;
    textPainter.paint(canvas, Offset(textX, textY));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
