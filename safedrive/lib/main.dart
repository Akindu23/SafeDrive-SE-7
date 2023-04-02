// @dart=2.9

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:safedrive/controllers/firebase_options.dart';
import 'package:safedrive/screens/home_page_screens/home_Page.dart';
import 'package:safedrive/screens/home_page_screens/main_Page.dart';
import 'package:safedrive/screens/fatigue_test_screens/test_fatigue.dart';
import 'package:safedrive/screens/login_screens/login_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

List<CameraDescription> camera;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  camera = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flutter login UI",
      home: mainPage(),


    );
  }
}