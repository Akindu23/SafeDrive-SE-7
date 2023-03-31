import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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
            Text("Sign In",
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
          "Email",
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
        const Text(
          "Password",
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

  Widget buildForgetPassBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
          onPressed: () => print("Forgot Password pressed"),
          child: const Text(
            "Forgot password?",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

  Widget buildRememberCb() {
    return SizedBox(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                value: isRememberMe,
                checkColor: Colors.green,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    isRememberMe = value!;
                  });
                },
              )),
          const Text(
            "Remember me",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
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
            child: Text("Sign In",
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

  Widget buildGoogleLogin(){
   return Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: const [
       Image(image: AssetImage("assets/images/googleLogo.png"),
        height: 30,
         width: 30,
       ),
       SizedBox(width: 10,),
       Text("Sign in with google",style: TextStyle(
          fontSize: 20,
         color: Colors.white,
         fontWeight: FontWeight.w500,
        ),
       ),
     ],
   );
  }


  Widget buildSignUpBtn() {
    return GestureDetector(
      // onTap: () => print("Sign Up Pressed"),
      child: RichText(
        text: const TextSpan(children: [
          TextSpan(
              text: "Don't have an account? ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
          ),
          TextSpan(
            text: "Sign Up",
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
                      buildForgetPassBtn(),
                      buildRememberCb(),
                      const SizedBox(height: 25,),
                      buildLoginBtn(),
                      const SizedBox(height: 25,),
                      buildGoogleLogin(),
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
