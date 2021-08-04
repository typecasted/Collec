import 'package:collec/Widgets/collection_screen_components/appbars.dart';
import 'package:collec/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({
    key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: SC().h(context) * 0.04,),
            color: Color(0xFF020828),
            child: PhotoScreenAppBar(),
          ),
        ],
      ),
    );
  }
}
