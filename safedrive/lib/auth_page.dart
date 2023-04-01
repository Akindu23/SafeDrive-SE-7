import 'package:flutter/material.dart';
import 'package:safedrive/screens/login_screens/loginScreen.dart';
import 'package:safedrive/screens/login_screens/signupScreenOne.dart';


class AuthPage extends StatefulWidget{
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  //intially, show the login page
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context){
    if (showLoginPage){
      return loginScreen(showSignupScreenOne: toggleScreens);
    }
    else{
      return signupScreenOne(showLoginPage: toggleScreens);
    }
  }
}