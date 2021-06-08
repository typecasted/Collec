import 'package:collec/UI/Components/collection_screen_components/preview_photo_page_view.dart';
import 'package:collec/utils/constants.dart';
import 'package:collec/utils/size_config.dart';
import 'package:flutter/material.dart';

class BottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeConfig().height(context) * 0.55,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig().width(context) * 0.05,
            vertical: SizeConfig().height(context) * 0.025),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig().width(context) * 0.05,
                  vertical: SizeConfig().height(context) * 0.015),
              child: Text(
                'Photos',
                style: headerStyle.copyWith(
                    fontSize: SizeConfig().height(context) * 0.045),
              ),
            ),
            Divider(
              thickness: 1.5,
            ),
            PreviewPhotoPageView(),
            GestureDetector(
              onTap: (){

              },
              child: SeeMoreButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class SeeMoreButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig().width(context) * 0.03,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: SizeConfig().height(context) * 0.05,
            width: SizeConfig().width(context) * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blueAccent,
            ),
            alignment: Alignment.center,
            child: Text(
              'See more',
              style: textStyle2.copyWith(
                  fontSize: SizeConfig().height(context) * 0.02),
            ),
          ),
        ],
      ),
    );
  }
}
