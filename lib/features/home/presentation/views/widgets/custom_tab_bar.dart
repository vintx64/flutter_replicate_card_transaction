import 'package:flutter/material.dart';
import 'package:flutter_replicate_card_transaction/core/utils/styles.dart';

import '../../../../../constants.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: TabBar(tabs: [
        Text(
          'Week',
          style: Styles.tabBarItemsStyle,
        ),
        Text(
          'Month',
          style: Styles.tabBarItemsStyle,
        ),
        Text(
          'Year',
          style: Styles.tabBarItemsStyle,
        ),
      ]),
    );
  }
}
