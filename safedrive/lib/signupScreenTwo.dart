// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/src/material/checkbox.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:safedrive/loginScreen.dart';
// import 'package:safedrive/signupScreenOne.dart';
//
//  class signupScreenTwo extends StatefulWidget {
//     // final VoidCallback showLoginPage;
//     // const signupScreenTwo({Key? key,required this.showLoginPage}) : super(key: key);
//
//   @override
//   _SignupScreenTwoState createState() => _SignupScreenTwoState();
// }
//
// class _SignupScreenTwoState extends State<signupScreenTwo> {
//
// //   //test controllers
// //   final _emailController = TextEditingController();
// //   final _passwordController = TextEditingController();
// //   final _confirmPasswordController = TextEditingController();
// //
// //
// //   @override
// //   void dispose() {
// //     _emailController.dispose();
// //     _passwordController.dispose();
// //     _confirmPasswordController.dispose();
// //     super.dispose();
// //   }
// //
// //
// //   Future signUp() async{
// //     if(passwordConfirmed()){
// //       await FirebaseAuth.instance
// //           .signInWithEmailAndPassword(
// //           email: _emailController.text.trim() ,
// //           password: _passwordController.text.trim(),
// //       );
// //     }
//  // }
//
// //   bool passwordConfirmed() {
// //     if (
// //     _passwordController.text.trim() == _confirmPasswordController.text.trim()){
// //       return true;
// //     }
// //     else{
// //       return false;
// //     }
// //
// //   }
// //
// //
// //
//   bool isRememberMe = false;
//
//   Widget buildTextSignUp(){
//     return Container(
//       alignment: Alignment.centerLeft,
//       child: Row(
//         children: [
//           Text("Sign Up",
//             style: TextStyle(
//               fontSize: 34,
//               fontWeight: FontWeight.bold,
//               color: Color(0xff000730),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//
//   Widget buildFirstName() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           "First Name",
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(50),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black26,
//                   blurRadius: 6,
//                   offset: Offset(0, 2),
//                 )
//               ]),
//           height: 60,
//           child: TextField(
//             // controller: _emailController,
//             // keyboardType: TextInputType.emailAddress,
//             style: TextStyle(
//               color: Colors.black87,
//             ),
//             decoration: InputDecoration(
//                 border: InputBorder.none,
//                 contentPadding: EdgeInsets.only(top: 14),
//                 prefixIcon: Icon(
//                   Icons.account_circle_rounded,
//                   color: Color(0xff1493ff),
//                 ),
//                 hintText: "First Name",
//                 hintStyle: TextStyle(
//                   color: Colors.black38,
//                 )),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget buildLastName() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           "Last Name",
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(50),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black26,
//                   blurRadius: 6,
//                   offset: Offset(0, 2),
//                 )
//               ]),
//           height: 60,
//           child: TextField(
//             // controller: _emailController,
//             // keyboardType: TextInputType.emailAddress,
//             style: TextStyle(
//               color: Colors.black87,
//             ),
//             decoration: InputDecoration(
//                 border: InputBorder.none,
//                 contentPadding: EdgeInsets.only(top: 14),
//                 prefixIcon: Icon(
//                   Icons.account_circle_rounded,
//                   color: Color(0xff1493ff),
//                 ),
//                 hintText: "Last Name",
//                 hintStyle: TextStyle(
//                   color: Colors.black38,
//                 )),
//           ),
//         ),
//       ],
//     );
//   }
//
//
//   Widget buildMobileNumber() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           "Mobile Number",
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(50),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black26,
//                   blurRadius: 6,
//                   offset: Offset(0, 2),
//                 )
//               ]),
//           height: 60,
//           child: TextField(
//             // controller: _emailController,
//             // keyboardType: TextInputType.emailAddress,
//             style: TextStyle(
//               color: Colors.black87,
//             ),
//             decoration: InputDecoration(
//                 border: InputBorder.none,
//                 contentPadding: EdgeInsets.only(top: 14),
//                 prefixIcon: Icon(
//                   Icons.phone,
//                   color: Color(0xff1493ff),
//                 ),
//                 hintText: "Mobile Number",
//                 hintStyle: TextStyle(
//                   color: Colors.black38,
//                 )),
//           ),
//         ),
//       ],
//     );
//   }
//
//
//
//
//
//
//
//   Widget buildNextBtn(){
//     return GestureDetector(
//       onTap: () {
//
//       },
//       child: Container(
//         padding: EdgeInsets.all(20),
//         decoration: BoxDecoration(
//             color: Color(0xff000730),
//             borderRadius: BorderRadius.circular(50),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black26,
//                 blurRadius: 6,
//                 offset: Offset(0, 2),
//               )
//             ]
//         ),
//         child: Center(
//           child: Text("Next",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//
//
//   Widget buildSignUpBtn() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text("Already have an account? ",
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 18,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         GestureDetector(
//             onTap:() {
//
//             },
//            // widget.showLoginPage,
//           child: Text("Sign In",
//             style: TextStyle(
//               color: Color(0xff000730),
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnnotatedRegion<SystemUiOverlayStyle>(
//         value: SystemUiOverlayStyle.light,
//         child: GestureDetector(
//           child: Stack(
//             children: <Widget>[
//               Container(
//                 height: double.infinity,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         colors: [
//                           Color(0x662e93a1),
//                           //Color(0x991493ff),
//                           //Color(0xcc1493ff),
//                           Color(0xff2e93a1),
//                         ])),
//                 child: SingleChildScrollView(
//                   physics: AlwaysScrollableScrollPhysics(),
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 25,
//                     vertical: 25,
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       SizedBox(height: 50,),
//                       Container(
//                         child: Image(image: AssetImage("assets/images/safedrivelogo.png"),
//                           height: 100,
//                           width: 100,
//                         ),
//                       ),
//                       Text(
//                         "SafeDrive",
//                         style: TextStyle(
//                           color: Color(0xff000730),
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 35,
//                       ),
//                       buildTextSignUp(),
//                       SizedBox(height: 20,),
//                       buildFirstName(),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       buildLastName(),
//                       SizedBox(height: 25,),
//                       buildMobileNumber(),
//                       SizedBox(height: 50,),
//                       buildNextBtn(),
//                       SizedBox(height: 25,),
//                       SizedBox(height: 25,),
//                       buildSignUpBtn(),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
