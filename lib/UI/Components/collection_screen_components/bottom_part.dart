

import 'package:collec/UI/Components/collection_screen_components/preview_photo_page_view.dart';
import 'package:collec/UI/Screens/photo_screen.dart';
import 'package:collec/utils/constants.dart';
import 'package:collec/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'other_components.dart';

class BottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SC().h(context) * 0.55,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SC().w(context) * 0.05,
            vertical: SC().h(context) * 0.025),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SC().w(context) * 0.05,
                  vertical: SC().h(context) * 0.015),
              child: Text(
                'Photos',
                style: headerStyle.copyWith(
                    fontSize: SC().h(context) * 0.045),
              ),
            ),
            Divider(
              thickness: 1.5,
            ),
            PreviewPhotoPageView(),
            GestureDetector(
              onTap: (){
                Get.to(PhotoScreen());
              },
              child: SeeMoreButton(),
            ),
          ],
        ),
      ),
    );
  }
}