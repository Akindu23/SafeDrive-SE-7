import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD:safedrive/lib/mainPage.dart
import 'package:safedrive/AddContacts.dart';
import 'package:safedrive/addContactNum.dart';
import 'package:safedrive/auth_page.dart';
import 'package:safedrive/homePage.dart';
import 'package:safedrive/signupScreenOne.dart';
import 'package:safedrive/signupScreenTwo.dart';
import 'package:safedrive/testFatigue.dart';
import 'testPage.dart';
import 'package:safedrive/loginScreen.dart';


=======
import 'package:safedrive/screens/emergency_contacts_screens/AddContacts.dart';
import 'package:safedrive/screens/emergency_contacts_screens/addContactNum.dart';
import 'package:safedrive/screens/home_page_screens/homePage.dart';
import 'package:safedrive/screens/login_screens/signupScreenOne.dart';
import 'package:safedrive/screens/login_screens/signupScreenTwo.dart';
import 'package:safedrive/screens/fatigue_test_screens/testFatigue.dart';
import '../login_screens/loginScreen.dart';
>>>>>>> 8642010c560d17b0ac48a9973ad5a53164be73dc:safedrive/lib/screens/home_page_screens/mainPage.dart

class mainPage extends StatelessWidget{
  const mainPage({Key? key}) : super(key: key);

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
            return AuthPage();
          }
        },
      ),
    );
  }
}