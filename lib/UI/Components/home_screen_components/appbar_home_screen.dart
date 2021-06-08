import 'package:collec/utils/constants.dart';
import 'package:collec/utils/size_config.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig().width(context) * 0.05, vertical: SizeConfig().height(context) * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Collec',
            style: headerStyle.copyWith(
              fontSize: SizeConfig().height(context) * 0.05,
            ),
          ),
          Icon(
            Icons.account_box_rounded,
            color: Color(0xFF20375A),
            size: SizeConfig().height(context) * 0.045,
          ),
        ],


      ),
    );
  }
}