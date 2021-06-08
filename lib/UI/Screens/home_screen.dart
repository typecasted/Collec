import 'package:collec/UI/Components/home_screen_components/appbar_home_screen.dart';
import 'package:collec/UI/Components/home_screen_components/floating_button.dart';
import 'package:collec/UI/Components/home_screen_components/search_bar.dart';
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
          ],
        ),
      ),
    );
  }
}



