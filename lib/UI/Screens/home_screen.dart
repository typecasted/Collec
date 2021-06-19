import 'package:collec/UI/Components/home_screen_components/appbar_home_screen.dart';
import 'package:collec/UI/Components/home_screen_components/floating_button.dart';
import 'package:collec/UI/Components/home_screen_components/search_bar.dart';
import 'package:collec/utils/size_config.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: SC().h(context) * 0.02,
                        horizontal: SC().w(context) * 0.05,
                      ),
                      child: Container(
                        height: SC().h(context) * 0.3,
                        // width: SizeConfig().width(context) * 0.5,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
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
