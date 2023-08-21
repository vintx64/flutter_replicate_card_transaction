import 'dart:math';

import 'package:flutter/material.dart';

class MockData {
  final String expenseName;
  final double value;
  final int transactions;
  final double percentage;
  final Color color;

  MockData(this.expenseName, this.value, this.transactions, this.percentage,
      this.color);
}

class CustomPieChart extends StatelessWidget {
  CustomPieChart({super.key});
  final List<MockData> mockDataList = [
    MockData('Shopping', 3500, 73, 0.5, const Color.fromRGBO(192, 192, 222, 1)),
    MockData(
        'Wellness', 1750, 73, 0.25, const Color.fromRGBO(160, 210, 193, 1)),
    MockData(
        'Transport', 875, 73, 0.125, const Color.fromRGBO(255, 176, 182, 1)),
    MockData('Bars & Resturants', 437.50, 73, 0.0625,
        const Color.fromRGBO(255, 194, 165, 1)),
    MockData('Subscriptions', 4186, 73, 0.185,
        const Color.fromRGBO(142, 155, 197, 1)),
  ];
  @override
  Widget build(BuildContext context) {
    return PieChartWidget(mockDataList);
  }
}

class PieChartWidget extends StatefulWidget {
  final List<MockData> mockDataList;

  const PieChartWidget(this.mockDataList, {super.key});

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PieChartPainter(widget.mockDataList),
      child: Container(),
    );
  }
}

class PieChartPainter extends CustomPainter {
  final List<MockData> mockDataList;
  PieChartPainter(
    this.mockDataList,
  );
  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2.0, size.height / 2.0);
    final raidus = size.width * 0.9;
    final rect = Rect.fromCenter(center: c, width: raidus, height: raidus);
    var startAngle = 0.0;
    for (var di in mockDataList) {
      var sweepAngle = di.percentage * 360.0 * pi / 180.0;
      final paint = Paint()
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = 16
        ..color = di.color;
      canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
