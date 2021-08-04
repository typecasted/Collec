import 'dart:io';

import 'package:collec/Screens/home_screen.dart';
import 'package:collec/utils/constants.dart';
import 'package:collec/utils/database_mathods.dart';
import 'package:collec/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class SetProfilePicScreen extends StatefulWidget {
  SetProfilePicScreen({key}) : super(key: key);

  @override
  _SetProfilePicScreenState createState() => _SetProfilePicScreenState();
}

class _SetProfilePicScreenState extends State<SetProfilePicScreen> {
  File _croppedImage;
  final picker = ImagePicker();
  bool isLoading = false;

  Future getImage({bool fromCamera}) async {
    final pickedFile = fromCamera
        ? await picker.getImage(source: ImageSource.camera)
        : await picker.getImage(source: ImageSource.gallery);
    final croppedImage = await ImageCropper.cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        aspectRatioPresets: [CropAspectRatioPreset.square],
        androidUiSettings: AndroidUiSettings());

    if (croppedImage != null) {
      setState(
        () {
          _croppedImage = croppedImage;
        },
      );
    } else {
      print('No image selected.');
    }

    setState(() {
      isLoading = true;
    });
    DatabaseMethods().uploadProfilePicToDatabase(profilePicture: _croppedImage);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        height: SC().h(context) * 0.055,
        width: SC().w(context) * 0.25,
        decoration: BoxDecoration(
          color: Color(0xFF375893),
          borderRadius: BorderRadius.circular(25),
        ),
        alignment: Alignment.center,
        child: Text(
          'Skip',
          style: textStyle2.copyWith(fontSize: SC().h(context) * 0.025),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DisplayPicture(
              image: _croppedImage,
            ),
            SizedBox(
              height: SC().h(context) * 0.05,
            ),
            GestureDetector(
              onTap: () {
                getImage(fromCamera: false);
              },
              child: SelectionButton(
                mode: 'Select Profile Picture',
              ),
            ),
            SizedBox(
              height: SC().h(context) * 0.03,
            ),
            GestureDetector(
              onTap: () => getImage(fromCamera: true),
              child: SelectionButton(
                mode: 'Take Picture',
              ),
            ),
            SizedBox(
              height: SC().h(context) * 0.03,
            ),
            _croppedImage != null
                ? GestureDetector(
                    onTap: () => Get.off(HomeScreen()),
                    child: Container(
                      height: SC().h(context) * 0.055,
                      width: SC().w(context) * 0.4,
                      decoration: BoxDecoration(
                        color: Color(0xFF375893),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Continue',
                        style: textStyle2.copyWith(
                            fontSize: SC().h(context) * 0.025),
                      ),
                    ),
                  )
                : Container(),
            isLoading
                ? Container(
                    height: SC().h(context) * 0.05,
                    width: SC().h(context) * 0.05,
                    child: CircularProgressIndicator(),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

class SelectionButton extends StatelessWidget {
  const SelectionButton({
    Key key,
    this.mode,
  }) : super(key: key);

  final String mode;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SC().h(context) * 0.055,
      width: SC().w(context) * 0.7,
      decoration: BoxDecoration(
        color: Color(0xFF375893),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Text(
        mode,
        style: textStyle2.copyWith(fontSize: SC().h(context) * 0.025),
      ),
    );
  }
}

class DisplayPicture extends StatelessWidget {
  const DisplayPicture({
    Key key,
    this.image,
  }) : super(key: key);

  final File image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SC().h(context) * 0.2,
      width: SC().h(context) * 0.2,
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.circular(100),
      ),
      child: image == null
          ? Image.asset('images/profile_pic_collec.png')
          : ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.file(
                image,
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}
