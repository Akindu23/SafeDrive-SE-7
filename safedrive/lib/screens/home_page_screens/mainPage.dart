import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safedrive/screens/emergency_contacts_screens/AddContacts.dart';
import 'package:safedrive/screens/emergency_contacts_screens/addContactNum.dart';
import 'package:safedrive/screens/home_page_screens/homePage.dart';
import 'package:safedrive/screens/login_screens/signupScreenOne.dart';
import 'package:safedrive/screens/login_screens/signupScreenTwo.dart';
import 'package:safedrive/screens/fatigue_test_screens/testFatigue.dart';
import '../login_screens/loginScreen.dart';

class mainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return homePage();
          }
          else{
            return loginScreen();
          }
        },
      ),
    );
  }
}