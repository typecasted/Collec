import 'package:collec/UI/Components/collection_screen_components/appbar_collection_screen.dart';
import 'package:collec/UI/Components/collection_screen_components/description_card_collection_screen.dart';
import 'package:collec/UI/Components/collection_screen_components/other_components.dart';

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
            BottomPart(),
          ],
        ),
      ),
    );
  }
}
