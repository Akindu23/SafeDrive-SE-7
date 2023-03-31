// @dart=2.9

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:safedrive/controllers/firebase_options.dart';
import 'package:safedrive/screens/home_page_screens/main_page.dart';
import 'package:firebase_core/firebase_core.dart';

List<CameraDescription> camera;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  camera = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "flutter login UI",
        home: MainPage(),
    );
  }
}
