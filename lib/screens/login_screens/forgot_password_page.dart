import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: _emailController.text.trim());
      showDialog(context: context, builder: (context){
        return const AlertDialog(
          content: Text("Password reset link sent! check your Email"),
        );
      });
    } on FirebaseAuthException catch(e){
      // print(e);
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        elevation: 0,
      ),
      body:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage("assets/images/forgotPasswordLock.png"),
                height: 200,
                width: 200,
              ),

              const Text("Trouble with logging in?",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15,),
              const Text(
                "Enter your Email account and we'll send you a link to get back into your account.",
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: 25,
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
              const SizedBox(height: 25,),
              // MaterialButton(onPressed: (){
              //   passwordReset();
              // } ,
              //
              //   child: Text("Reset Password",
              //     style: TextStyle(
              //       color: Colors.white,
              //     ),
              //   ),
              //   color: Color(0xff000730),
              //
              // ),


              GestureDetector(
                onTap: (){
                  passwordReset();
                },
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
                    child: Text("Reset Password",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),



              // GestureDetector(
              //   onTap: () {},
              //   child: Text("Back to Sign In",
              //       style: TextStyle(
              //         color: Color(0xff000730),
              //         fontSize: 18,
              //         fontWeight: FontWeight.bold,
              //       ),
              //   ),
              // ),
            ],
          ),
        ),
      ),

    );
  }
}