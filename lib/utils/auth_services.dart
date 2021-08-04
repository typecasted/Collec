import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collec/Screens/home_screen.dart';
import 'package:collec/Screens/set_profile_picture_screen.dart';
import 'package:collec/Screens/start_collection_screen.dart';
import 'package:collec/utils/constants.dart';
import 'package:collec/utils/size_config.dart';
import 'package:collec/utils/user_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  signUp({
    String userName,
    String email,
    String password,
    @required BuildContext context,
  }) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // ...Implement fireStore database...

      _fireStore.collection('users').doc(email).set(
        {
          'username': userName,
          'email': email,
        },
      );

      // ...Saving user's information in device...
      UsersInfo().userInfo.write('username', userName);
      UsersInfo().userInfo.write('email', email);

      // ...Set navigation to other screen...
      Get.off(SetProfilePicScreen());
    } on FirebaseAuthException catch (e) {
      print(e.code);
      authExceptions(e: e, context: context);
    }
  }

  signIn({
    String email,
    String password,
    @required BuildContext context,
  }) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // ...Retrieve data from database...
      QuerySnapshot query = await _fireStore
          .collection('users')
          .where('email', isEqualTo: email)
          .get()
          .then((value) {
        value.docs.forEach(
          (element) {
            // ...Saving user's information in device...
            UsersInfo().userInfo.write('username', element['username']);
            UsersInfo().userInfo.write('email', element['email']);
          },
        );

        return value;
      });

      // ...Set navigation to other screen...
      Get.off(StartCollectionScreen());
    } on FirebaseAuthException catch (e) {
      print(e.code);
      authExceptions(e: e, context: context);
    }
  }

  signInWithGoogle({@required bool signingIn}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

    User user;

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        user = userCredential.user;

        print('${user.email} google sign in!!!');

        // ...Implement fireStore database...

        QuerySnapshot query = await _fireStore
            .collection('users')
            .where('email', isEqualTo: user.email)
            .get();

        if (query.docs.isEmpty) {
          _fireStore.collection('users').doc(user.email).set(
            {
              'username': user.displayName,
              'email': user.email,
            },
          );

          // ...Saving user's information in device...
          UsersInfo().userInfo.write('username', user.displayName);
          UsersInfo().userInfo.write('email', user.email);

          // ...Set navigation to other screen...
          Get.off(SetProfilePicScreen());
        } else {
          query.docs.forEach(
            (element) {
              // ...Saving user's information in device...
              UsersInfo().userInfo.write('username', element['username']);
              UsersInfo().userInfo.write('email', element['email']);

              // ...Set navigation to other screen...
              Get.off(StartCollectionScreen());
            },
          );
        }


      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          print('!!!!!!!!account-exists-with-different-credential!!!!!!!!');
        } else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
    }

    // return user;
  }
}

SnackBar authErrorSnackBar({BuildContext context, String message}) {
  return SnackBar(
    content: Text(
      message,
      style: textStyle2,
    ),
    duration: Duration(milliseconds: 1500),
    width: SC().w(context) * 0.8,
    padding: EdgeInsets.symmetric(
      horizontal: SC().w(context) * 0.05,
    ),
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}

authExceptions({FirebaseAuthException e, BuildContext context}) {
  switch (e.code) {
    case 'weak-password':
      print(e.code);
      ScaffoldMessenger.of(context).showSnackBar(
        authErrorSnackBar(
          context: context,
          message: 'Weak Password',
        ),
      );
      break;

    case 'wrong-password':
      ScaffoldMessenger.of(context).showSnackBar(
        authErrorSnackBar(
          context: context,
          message: 'Wrong Password!',
        ),
      );
      break;

    case 'invalid-email':
      ScaffoldMessenger.of(context).showSnackBar(
        authErrorSnackBar(
          context: context,
          message: 'Invalid Email',
        ),
      );
      break;

    case 'email-already-in-use':
      ScaffoldMessenger.of(context).showSnackBar(
        authErrorSnackBar(
          context: context,
          message: 'Email Already In Use',
        ),
      );
      break;

    case 'unknown':
      ScaffoldMessenger.of(context).showSnackBar(
        authErrorSnackBar(
          context: context,
          message: 'Input Field is Empty',
        ),
      );
      break;

    case 'user-not-found':
      ScaffoldMessenger.of(context).showSnackBar(
        authErrorSnackBar(
          context: context,
          message: 'User does not exist',
        ),
      );
      break;
  }
}
