


import 'package:collec/UI/Screens/home_screen.dart';
import 'package:collec/utils/constants.dart';
import 'package:collec/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CollectionScreenAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SC().w(context) * 0.05,
          vertical: SC().h(context) * 0.025),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              Get.off(HomeScreen());
            },
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: SC().h(context) * 0.03,
            ),
          ),
          Text(
            // TODO : put collection name
            'Collection Name',
            style: textStyle2.copyWith(
              fontSize: SC().h(context) * 0.035,
            ),
          ),

          Container(),
        ],
      ),
    );
  }
}


class PhotoScreenAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SC().w(context) * 0.05,
          vertical: SC().h(context) * 0.025),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: SC().h(context) * 0.03,
            ),
          ),
          Text(
            // TODO : put collection name
            'Collection Name',
            style: textStyle2.copyWith(
              fontSize: SC().h(context) * 0.035,
            ),
          ),

          GestureDetector(
            onTap: (){
            },
            child: Icon(
              Icons.add_circle_outline_rounded,
              color: Colors.blueAccent,
              size: SC().h(context) * 0.025,
            ),
          ),
        ],
      ),
    );
  }
}