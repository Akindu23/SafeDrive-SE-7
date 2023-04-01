import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreenOne extends StatefulWidget {
  const SignupScreenOne({super.key});

  @override
  State<SignupScreenOne> createState() => _SignupScreenOneState();
}

class _SignupScreenOneState extends State<SignupScreenOne> {

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
        children: const [
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
        const Text(
          "First Name",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
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
            style: const TextStyle(
              color: Colors.black87,
            ),
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.account_circle_rounded,
                  color: Color(0xff1493ff),
                ),
                hintText: "First Name",
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
        const Text(
          "Last Name",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
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
            style: const TextStyle(
              color: Colors.black87,
            ),
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.account_circle_rounded,
                  color: Color(0xff1493ff),
                ),
                hintText: "Last Name",
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
        const Text(
          "Mobile Number",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
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
            style: const TextStyle(
              color: Colors.black87,
            ),
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.phone,
                  color: Color(0xff1493ff),
                ),
                hintText: "Mobile Number",
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
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: const Color(0xff000730),
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              )
            ]
        ),
        child: const Center(
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
      // onTap: () => print("Sign Up Pressed"),
      child: RichText(
        text: const TextSpan(children: [
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
                decoration: const BoxDecoration(
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
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 25,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 50,),
                      const Image(image: AssetImage("assets/images/safedrivelogo.png"),
                        height: 100,
                        width: 100,
                      ),
                      const Text(
                        "SafeDrive",
                        style: TextStyle(
                          color: Color(0xff000730),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      buildTextSignUp(),
                      const SizedBox(height: 20,),
                      buildEmail(),
                      const SizedBox(
                        height: 20,
                      ),
                      buildPassword(),
                      const SizedBox(height: 25,),
                      buildMobNumber(),
                      const SizedBox(height: 50,),
                      buildLoginBtn(),
                      const SizedBox(height: 25,),
                      const SizedBox(height: 25,),
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
