import 'package:flutter/material.dart';
import 'package:flutter_replicate_card_transaction/constants.dart';

import '../../../../../core/utils/styles.dart';

PreferredSizeWidget customAppBar({required String title}) {
  return AppBar(
    backgroundColor: kPrimaryColor,
    elevation: 0,
    title: Text(title, style: Styles.appBarTxtStyle),
  );
}
