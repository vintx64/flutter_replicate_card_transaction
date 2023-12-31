import 'package:flutter/material.dart';
import 'package:flutter_replicate_card_transaction/constants.dart';
import '../../../../../core/utils/styles.dart';

PreferredSizeWidget customAppBar({required String title}) {
  return AppBar(
    centerTitle: true,
    leading: const Icon(
      Icons.arrow_back_ios,
      size: 24,
      color: Colors.black,
    ),
    backgroundColor: kPrimaryColor,
    elevation: 0,
    title: Text(title, style: Styles.appBarTxtStyle),
  );
}
