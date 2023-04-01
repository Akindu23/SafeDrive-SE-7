import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:safedrive/firebase_options.dart';
import 'package:safedrive/homePage.dart';
import 'package:safedrive/mainPage.dart';
import 'package:safedrive/testFatigue.dart';
import 'loginScreen.dart';
import 'package:firebase_core/firebase_core.dart';

List<CameraDescription>? camera;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  camera = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flutter login UI",
      home: mainPage(),
    );
  }
}
