


import 'package:collec/utils/constants.dart';
import 'package:collec/utils/size_config.dart';
import 'package:flutter/material.dart';

class CollectionAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig().width(context) * 0.05,
          vertical: SizeConfig().height(context) * 0.025),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: SizeConfig().height(context) * 0.03,
          ),
          Text(
            // TODO : put collection name
            'Collection Name',
            style: textStyle2.copyWith(
              fontSize: SizeConfig().height(context) * 0.035,
            ),
          ),
          Icon(
            Icons.add_circle_outline_rounded,
            color: Colors.blueAccent,
            size: SizeConfig().height(context) * 0.03,
          )
        ],
      ),
    );
  }
}