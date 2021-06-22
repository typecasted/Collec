import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collec/utils/user_info.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class DatabaseMethods {
  final FirebaseStorage _fbStorage = FirebaseStorage.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  uploadProfilePicToDatabase({@required File profilePicture}) async {
    TaskSnapshot snapshot = await _fbStorage
        .ref()
        .child(
            'profile_pictures/${UsersInfo().userInfo.read('email')}_profile_pic')
        .putFile(profilePicture);

    if (snapshot.state == TaskState.success) {
      final profilePicUrl = await snapshot.ref.getDownloadURL();

      await _fireStore
          .collection('users')
          .doc(UsersInfo().userInfo.read('email'))
          .update({
        'profile_pic_url': profilePicUrl,
      });

      print('!!!!!!!!!!!!!Success!!!!!!!!!!!!!');
    }
  }

  uploadPhotosToDatabase({@required File photo, String photoName}) async {
    TaskSnapshot snapshot = await _fbStorage
        .ref()
        .child('Photos/${UsersInfo().userInfo.read('email')}/$photoName}')
        .putFile(photo);

    if (snapshot.state == TaskState.success) {
      final url = await snapshot.ref.getDownloadURL();

      await _fireStore
          .collection('users')
          .doc(UsersInfo().userInfo.read('email'))
          .collection('collections')
          .doc('first collection')
          .collection('images')
          .add({
        'url': url,
      });

      print('!!!!!!!!!!!!!Photo Uploaded!!!!!!!!!!!!!');
    }
  }
}
