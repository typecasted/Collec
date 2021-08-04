import 'package:collec/utils/constants.dart';
import 'package:collec/utils/size_config.dart';
import 'package:flutter/cupertino.dart';



class SignInUpButton extends StatelessWidget {
  const SignInUpButton({
    Key key,
    this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SC().h(context) * 0.025,
      ),
      child: Container(
          height: SC().h(context) * 0.075,
          width: SC().w(context) * 0.65,
          decoration: BoxDecoration(
            color: Color(0xFF20375A),
            borderRadius: BorderRadius.circular(50),
          ),
          alignment: Alignment.center,
          child: Text(
            message,
            style: textStyle2.copyWith(fontSize: SC().h(context) * 0.025),
          )),
    );
  }
}


class SignInUpWithGoogleButton extends StatelessWidget {
  const SignInUpWithGoogleButton({
    Key key, this.message,
  }) : super(key: key);

  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SC().h(context) * 0.07,
      width: SC().w(context) * 0.75,
      decoration: BoxDecoration(
        color: Color(0xFF375893),
        borderRadius: BorderRadius.circular(50),
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          vertical: SC().h(context) * 0.01,
          horizontal: SC().w(context) * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: SC().h(context) * 0.04,
            width: SC().h(context) * 0.04,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/google_logo.png'),
                  fit: BoxFit.fill),
            ),
          ),
          Text(
            message,
            style: textStyle2.copyWith(fontSize: SC().h(context) * 0.025),
          )
        ],
      ),
    );
  }
}
