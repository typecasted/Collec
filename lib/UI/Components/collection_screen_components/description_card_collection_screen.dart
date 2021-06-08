


import 'package:collec/utils/constants.dart';
import 'package:collec/utils/size_config.dart';
import 'package:flutter/material.dart';

class DescriptionCard extends StatelessWidget {
  const DescriptionCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig().width(context) * 0.05,
          vertical: SizeConfig().height(context) * 0.025),
      child: Container(
        height: SizeConfig().height(context) * 0.25,
        width: SizeConfig().width(context) * 0.85,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFF304BFF),
        ),


        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig().width(context) * 0.05,
              vertical: SizeConfig().height(context) * 0.025),
          child: Text(
            'The Description is here.',
            style: textStyle2.copyWith(fontSize: SizeConfig().height(context) * 0.02),
          ),
        ),
      ),
    );
  }
}

