import 'package:flutter/material.dart';
import 'package:flutter_replicate_card_transaction/constants.dart';
import 'package:flutter_replicate_card_transaction/core/utils/styles.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, initialIndex: 1, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: DefaultTabController(
        length: 3,
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          indicatorColor: kPrimaryColor,
          unselectedLabelColor: const Color.fromRGBO(152, 159, 185, 1),
          tabs: [
            _buildTab('Week', 0),
            _buildTab('Month', 1),
            _buildTab('Year', 2),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String text, int tabIndex) {
    return AnimatedBuilder(
      animation: _tabController.animation!,
      builder: (context, child) {
        double scale = 1.0;
        if (_tabController.index == tabIndex) {
          scale = 1.2;
        }
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
      child: Text(
        text,
        style: Styles.tabBarItemsStyle,
      ),
    );
  }
}
