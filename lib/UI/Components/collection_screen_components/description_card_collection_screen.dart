
import 'package:collec/utils/size_config.dart';
import 'package:flutter/material.dart';

class DescriptionCard extends StatelessWidget {
  const DescriptionCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(
          left: SC().w(context) * 0.05,
          right: SC().w(context) * 0.05,
          bottom: SC().h(context) * 0.06,
        ),
        child: Center(
          child: Text(
            // TODO : implement description variable
            'Collection Description',
            style: TextStyle(
              color: Colors.white,
              fontSize: SC().h(context) * 0.04,
            ),
          ),
        ),
      ),
    );
  }
}
