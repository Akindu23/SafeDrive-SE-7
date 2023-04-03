import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safedrive/auth_page.dart';
import 'package:safedrive/screens/home_page_screens/home_Page.dart';




class mainPage extends StatelessWidget{
  const mainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return HomePage();
          }
          else{
            return AuthPage();
          }
        },
      ),
    );
  }
}