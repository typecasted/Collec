

import 'package:collec/utils/size_config.dart';
import 'package:flutter/material.dart';

class PreviewPhotoPageView extends StatelessWidget {
  const PreviewPhotoPageView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig().height(context) * 0.025),
        child: Container(
          child: PageView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blueAccent),
                  ),
                );
              }),
        ),
      ),
    );
  }
}