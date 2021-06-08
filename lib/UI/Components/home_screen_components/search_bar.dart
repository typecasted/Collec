
import 'package:collec/utils/constants.dart';
import 'package:collec/utils/size_config.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig().height(context) * 0.01,
          horizontal: SizeConfig().width(context) * 0.04),
      child: TextField(
        style: textStyle1.copyWith(
            fontSize: SizeConfig().height(context) * 0.02),

        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Search Collection',
          prefixIcon: Icon(
            Icons.search,
            size: SizeConfig().height(context) * 0.035,
            color: Color(0xFF325084),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.black26),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}