import 'package:collec/Screens/signin_screen.dart';
import 'package:collec/utils/constants.dart';
import 'package:collec/utils/size_config.dart';
import 'package:collec/utils/user_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SC().w(context) * 0.05,
        vertical: SC().h(context) * 0.04,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Collec',
            style: headerStyle.copyWith(
              fontSize: SC().h(context) * 0.05,
            ),
          ),
          GestureDetector(
            onTap: () async {
              UsersInfo().userInfo.write('loggedIn', false);
              bool isSignedIn = await GoogleSignIn().isSignedIn();
              if (isSignedIn) {
                GoogleSignIn().signOut();
              }

              UsersInfo().userInfo.write('username', null);
              UsersInfo().userInfo.write('email', null);
              Get.off(SignInScreen());
            },
            child: Icon(
              Icons.account_box_rounded,
              color: Color(0xFF20375A),
              size: SC().h(context) * 0.045,
            ),
          ),
        ],
      ),
    );
  }
}
