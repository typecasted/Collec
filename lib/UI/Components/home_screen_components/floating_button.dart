import 'package:collec/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'dialog_box.dart';


class FloatingButton extends StatelessWidget {
  const FloatingButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: SC().h(context) * 0.02,
          horizontal: SC().w(context) * 0.03),
      child: Container(
        width: SC().w(context) * 0.2,
        height: SC().h(context) * 0.1,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              print("Floating action button get pressed.");
              return showDialog(
                  context: context,
                  builder: (_) => MyDialogBox());
            },
            backgroundColor: Color(0xFF2F4AFB),
            child: Icon(
              Icons.add,
            ),
          ),
        ),
      ),
    );
  }
}

