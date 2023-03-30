import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/material/checkbox.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signupScreenTwo extends StatefulWidget {
  @override
  _SignupScreenTwoState createState() => _SignupScreenTwoState();
}

class _SignupScreenTwoState extends State<signupScreenTwo> {

  //test controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async{
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: _emailController.text.trim() ,
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool isRememberMe = false;

  Widget buildTextSignUp(){
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Text("Sign Up",
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Color(0xff000730),
            ),
          ),
        ],
      ),
    );
  }


  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Email",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                )
              ]),
          height: 60,
          child: TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xff1493ff),
                ),
                hintText: "Email",
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
          ),
        ),
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Password",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                )
              ]),
          height: 60,
          child: TextField(
            controller: _passwordController,
            obscureText: true,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xff1493ff),
                ),
                hintText: "Password",
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
          ),
        ),
      ],
    );
  }

  Widget buildMobNumber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Confirm Password",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                )
              ]),
          height: 60,
          child: TextField(
            controller: _passwordController,
            obscureText: true,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xff1493ff),
                ),
                hintText: "Confirm Password",
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
          ),
        ),
      ],
    );
  }



  Widget buildLoginBtn(){
    return GestureDetector(
      onTap: signIn,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Color(0xff000730),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              )
            ]
        ),
        child: Center(
          child: Text("Sign Up",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }



  Widget buildSignUpBtn() {
    return GestureDetector(
      onTap: () => print("Sign Up Pressed"),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: "Already have an account ? ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: "Sign In",
            style: TextStyle(
              color: Color(0xff000730),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0x87ceebff),
                          //Color(0x991493ff),
                          //Color(0xcc1493ff),
                          Color(0xff2e93ff),
                        ])),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 25,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 50,),
                      Container(
                        child: Image(image: AssetImage("assets/images/safedrivelogo.png"),
                          height: 100,
                          width: 100,
                        ),
                      ),
                      Text(
                        "SafeDrive",
                        style: TextStyle(
                          color: Color(0xff000730),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      buildTextSignUp(),
                      SizedBox(height: 20,),
                      buildEmail(),
                      SizedBox(
                        height: 20,
                      ),
                      buildPassword(),
                      SizedBox(height: 25,),
                      buildMobNumber(),
                      SizedBox(height: 50,),
                      buildLoginBtn(),
                      SizedBox(height: 25,),
                      SizedBox(height: 25,),
                      buildSignUpBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
