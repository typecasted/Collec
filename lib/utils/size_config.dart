
import 'package:flutter/cupertino.dart';

class SizeConfig{

  height(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
  width(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
}