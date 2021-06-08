import 'package:collec/UI/Screens/collection_screen.dart';
import 'package:collec/UI/Screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: HomeScreen(),
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        CollectionScreen.id: (context) => CollectionScreen(),

      },
    );
  }
}
