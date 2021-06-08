import 'package:collec/UI/Components/collection_screen_components/appbar_collection_screen.dart';
import 'package:collec/UI/Components/collection_screen_components/description_card_collection_screen.dart';
import 'package:collec/utils/constants.dart';
import 'package:collec/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    CollectionAppBar(),
                    DescriptionCard(),
                  ],
                ),
              ),
            ),
            Container(
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
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig().height(context) * 0.025),
                        child: Container(
                          child:
                          PageView.builder(
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: SizeConfig().width(context) * 0.05,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.red
                                  ),
                                );
                              }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
