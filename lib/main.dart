import 'package:collec/UI/Screens/collection_screen.dart';
import 'package:collec/UI/Screens/home_screen.dart';
import 'package:collec/UI/Screens/signin_screen.dart';
import 'package:collec/utils/user_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  print(
      '${UsersInfo().userInfo.read('username')}, ${UsersInfo().userInfo.read('email')}');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: UsersInfo().userInfo.read('loggedIn') != null
          ? UsersInfo().userInfo.read('loggedIn')
              ? HomeScreen()
              : SignInScreen()
          : SignInScreen(),
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        CollectionScreen.id: (context) => CollectionScreen(),
      },
    );
  }
}
