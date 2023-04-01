import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:safedrive/homePage.dart';
import 'loginScreen.dart';

import 'package:safedrive/AddContacts.dart';
import 'package:safedrive/addContactNum.dart';
import 'package:safedrive/auth_page.dart';
import 'package:safedrive/homePage.dart';
import 'package:safedrive/signupScreenOne.dart';
import 'package:safedrive/signupScreenTwo.dart';
import 'package:safedrive/testFatigue.dart';

import 'testPage.dart';
import 'package:safedrive/loginScreen.dart';


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