import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collec/Widgets/home_screen_components/appbar_home_screen.dart';
import 'package:collec/Widgets/home_screen_components/floating_button.dart';
import 'package:collec/Widgets/home_screen_components/search_bar.dart';
import 'package:collec/utils/size_config.dart';
import 'package:collec/utils/user_info.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    UsersInfo().userInfo.write('loggedIn', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingButton(),
      body: SafeArea(
        child: Column(
          children: [
            MyAppBar(),
            SearchBar(),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: SC().h(context) * 0.02,
                  horizontal: SC().w(context) * 0.02,
                ),
                child: StreamBuilder<QuerySnapshot>(
                  stream: _fireStore
                      .collection('users')
                      .doc(UsersInfo().userInfo.read('email'))
                      .collection('collections')
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: SC().h(context) * 0.02,
                        horizontal: SC().w(context) * 0.05,
                      ),
                      child: Container(
                        height: SC().h(context) * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text('${snapshot.data.docs}'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Padding(
// padding: EdgeInsets.symmetric(
// vertical: SC().h(context) * 0.02,
// horizontal: SC().w(context) * 0.05,
// ),
// child: Container(
// height: SC().h(context) * 0.3,
// decoration: BoxDecoration(
// color: Colors.blueAccent,
// borderRadius: BorderRadius.circular(20),
// ),
// ),
// )


