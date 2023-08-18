import 'package:flutter/material.dart';
import 'package:flutter_replicate_card_transaction/constants.dart';
import 'package:flutter_replicate_card_transaction/core/utils/styles.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: const DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: TabBar(
            labelColor: Colors.black,
            indicatorColor: kPrimaryColor,
            unselectedLabelColor: Color.fromRGBO(152, 159, 185, 1),
            tabs: [
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
      ),
    );
  }
}
