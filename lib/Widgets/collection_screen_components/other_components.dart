
import 'package:collec/utils/constants.dart';
import 'package:collec/utils/size_config.dart';
import 'package:flutter/material.dart';



class SeeMoreButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SC().w(context) * 0.03,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: SC().h(context) * 0.05,
            width: SC().w(context) * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blueAccent,
            ),
            alignment: Alignment.center,
            child: Text(
              'See more',
              style: textStyle2.copyWith(
                  fontSize: SC().h(context) * 0.02),
            ),
          ),
        ],
      ),
    );
  }
}


