import 'package:collec/Widgets/collection_screen_components/appbars.dart';
import 'package:collec/Widgets/collection_screen_components/description_card_collection_screen.dart';
import 'package:collec/Widgets/collection_screen_components/other_components.dart';
import 'package:collec/Widgets/collection_screen_components/preview_photo_page_view.dart';
import 'package:collec/Screens/photo_screen.dart';
import 'package:collec/utils/constants.dart';
import 'package:collec/utils/size_config.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CollectionScreen extends StatefulWidget {
  static String id = 'collection_screen';

  @override
  _CollectionScreenState createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF020828),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    CollectionScreenAppBar(),
                    DescriptionCard(),
                  ],
                ),
              ),
            ),
            BottomPart(),
          ],
        ),
      ),
    );
  }
}


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
