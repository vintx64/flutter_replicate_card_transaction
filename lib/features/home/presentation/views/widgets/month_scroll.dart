import 'package:flutter/material.dart';
import 'package:flutter_replicate_card_transaction/constants.dart';

class MonthScroll extends StatefulWidget {
  const MonthScroll({super.key});

  @override
  State<MonthScroll> createState() => _MonthScrollState();
}

class _MonthScrollState extends State<MonthScroll> {
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  int currentMonthIndex = DateTime.now().month - 1;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentMonthIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      currentMonthIndex = index;
    });
  }

  void changeMonth(int delta) {
    _pageController.animateToPage(
      currentMonthIndex + delta,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => changeMonth(-1),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        SizedBox(
          width: 200,
          height: 40,
          child: PageView.builder(
            controller: _pageController,
            itemCount: months.length,
            onPageChanged: onPageChanged,
            itemBuilder: (context, index) {
              return Center(
                child: Text(
                  months[index],
                  style: TextStyle(
                    fontSize: currentMonthIndex == index ? 18 : 16,
                    fontFamily: kLatoRegular,
                  ),
                ),
              );
            },
          ),
        ),
        IconButton(
          onPressed: () => changeMonth(1),
          icon: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
