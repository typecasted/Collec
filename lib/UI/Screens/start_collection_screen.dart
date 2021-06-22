import 'dart:async';
import 'dart:io';

import 'package:collec/utils/constants.dart';
import 'package:collec/utils/database_mathods.dart';
import 'package:collec/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';


class StartCollectionScreen extends StatefulWidget {
  const StartCollectionScreen({key}) : super(key: key);

  @override
  _StartCollectionScreenState createState() => _StartCollectionScreenState();
}

class _StartCollectionScreenState extends State<StartCollectionScreen> {
  StreamController<bool> _controller = StreamController<bool>();

  Stream<bool> get loadingStream => _controller.stream;

  Sink<bool> get loadingSink => _controller.sink;

  pickFiles() async {
    FilePickerResult result = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.image);

    try {
      loadingSink.add(true);
      if (result != null) {
        List<PlatformFile> files = result.files.toList();
        files.forEach(
          (element) {
            print(element.name);
            DatabaseMethods().uploadPhotosToDatabase(
              photo: File(element.path),
              photoName: element.name,
            );
          },
        );
      } else {
        // User canceled the picker
      }

      loadingSink.add(false);
    } on PlatformException catch (e) {
      print('${e.code} : ${e.message}!!!!');
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Collec',
              style: headerStyle.copyWith(
                fontSize: SC().h(context) * 0.05,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    child: ClipRRect(
                      child: Image(
                        image: AssetImage(
                          'images/collecting_pana.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    height: SC().h(context) * 0.3,
                    width: SC().w(context) * 0.9,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SC().w(context) * 0.05,
                      vertical: SC().h(context) * 0.035,
                    ),
                    child: Text(
                      'Let\'s Start the Collection',
                      style:
                          textStyle1.copyWith(fontSize: SC().h(context) * 0.03),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SC().w(context) * 0.05,
                      vertical: SC().h(context) * 0.04,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        pickFiles();
                      },
                      child: Container(
                        height: SC().h(context) * 0.07,
                        width: SC().w(context) * 0.4,
                        decoration: BoxDecoration(
                          color: Color(0xFF375893),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.add_circle,
                          size: SC().h(context) * 0.04,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  StreamBuilder<bool>(
                    initialData: false,
                    stream: loadingStream,
                    builder: (context, snapshot) {
                      return snapshot.data
                          ? Container(
                              height: SC().h(context) * 0.05,
                              width: SC().h(context) * 0.05,
                              color: Colors.red,
                            )
                          : Container();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
