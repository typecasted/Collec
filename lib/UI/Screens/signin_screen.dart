import 'package:collec/UI/Components/sign_in_up_screen_components/other_components.dart';
import 'package:collec/UI/Components/sign_in_up_screen_components/text_field.dart';
import 'package:collec/UI/Screens/signup_screen.dart';
import 'package:collec/utils/auth_services.dart';
import 'package:collec/utils/constants.dart';
import 'package:collec/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({
    key,
  }) : super(
          key: key,
        );

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(

      backgroundColor: Colors.red,

      child: Scaffold(
        body: Builder(
          builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Collec',
                style: headerStyle.copyWith(
                  fontSize: SC().h(context) * 0.05,
                ),
              ),
              SizedBox(
                height: SC().h(context) * 0.03,
              ),
              TextFieldLoginScreen(
                hint: 'Email',
                icon: Icons.alternate_email,
                textInputType: TextInputType.emailAddress,
                controller: emailController,
                isPass: false,
              ),
              TextFieldLoginScreen(
                hint: 'Password',
                icon: Icons.password,
                controller: passwordController,
                isPass: true,
              ),
              GestureDetector(
                onTap: () {
                  print('!!!!Showing progress!!!!!');
                  final progressHud = ProgressHUD.of(context);
                  progressHud?.show();
                  AuthService().signIn(
                    context: context,
                    email: emailController.text.trimRight(),
                    password: passwordController.text.trimRight(),
                  );

                  progressHud?.dismiss();
                  emailController.clear();
                  passwordController.clear();
                },
                child: SignInUpButton(
                  message: 'Sign in',
                ),
              ),
              GestureDetector(
                onTap: () => AuthService().signInWithGoogle(signingIn: true),
                child: SignInUpWithGoogleButton(
                  message: 'Sign in with Google',
                ),
              ),
              SizedBox(
                height: SC().h(context) * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  Get.off(SignUpScreen());
                },
                child: Text(
                  'Create Account',
                  style: textStyle1.copyWith(fontSize: SC().h(context) * 0.02),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
