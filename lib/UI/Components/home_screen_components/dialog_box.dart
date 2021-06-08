import 'package:collec/UI/Screens/collection_screen.dart';
import 'package:collec/utils/constants.dart';
import 'package:collec/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyDialogBox extends StatefulWidget {
  @override
  _MyDialogBoxState createState() => _MyDialogBoxState();
}

class _MyDialogBoxState extends State<MyDialogBox> {
  final TextEditingController _collectionNameController =
      TextEditingController();
  final TextEditingController _collectionDescriptionController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _collectionNameController.dispose();
    _collectionDescriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig().height(context) * 0.02,
            horizontal: SizeConfig().width(context) * 0.05),
        child: Container(
          width: SizeConfig().width(context) * 0.4,
          height: SizeConfig().height(context) * 0.53,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig().height(context) * 0.005),
                child: Container(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'New Collection',
                      style: headerStyle.copyWith(
                        fontSize: SizeConfig().height(context) * 0.035,
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 2,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig().height(context) * 0.005),
                child: Text(
                  'Name',
                  style: headerStyle.copyWith(
                      fontSize: SizeConfig().height(context) * 0.025),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig().height(context) * 0.01,
                ),
                child: TextField(
                  controller: _collectionNameController,
                  style: textStyle1.copyWith(
                      fontSize: SizeConfig().height(context) * 0.02),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Name of the Collection',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black26),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig().height(context) * 0.005),
                child: Text(
                  'Description',
                  style: headerStyle.copyWith(
                      fontSize: SizeConfig().height(context) * 0.025),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig().height(context) * 0.01,
                ),
                child: TextField(
                  controller: _collectionDescriptionController,
                  style: textStyle1.copyWith(
                      fontSize: SizeConfig().height(context) * 0.02),
                  maxLines: 5,
                  maxLength: 200,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'Description for Collection',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black26),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig().height(context) * 0.01,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        sendUserToCollectionScreen(collectionName: _collectionNameController.text, collectionDescription: _collectionDescriptionController.text, context: context);
                        _collectionNameController.clear();
                        _collectionDescriptionController.clear();
                      },
                      child: Container(
                        height: SizeConfig().height(context) * 0.05,
                        width: SizeConfig().width(context) * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFF2F4AFB),
                        ),
                        child: Center(
                          child: Text(
                            'Create',
                            style: TextStyle(
                                fontSize: SizeConfig().height(context) * 0.02,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

sendUserToCollectionScreen(
    {String collectionName,
    String collectionDescription,
    BuildContext context}) {

  if (collectionName.isNotEmpty && collectionDescription.isNotEmpty){

    Navigator.pushReplacementNamed(context, CollectionScreen.id);
  }
}
