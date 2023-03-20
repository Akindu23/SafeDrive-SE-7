import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:safedrive/addContactNum.dart';

import 'AddContacts.dart';
=======
import 'package:safedrive/camera_screen.dart';
import 'package:safedrive/util_functions.dart';
>>>>>>> 024f0f7560630ee5bca1693ad4be8c3129fc36c0

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              SizedBox(height: 25,),
              Text("sign in as " + user.email!),
              MaterialButton(onPressed: () {
                FirebaseAuth.instance.signOut();
              },
                color: Colors.blue,
                child: Text("sign out"),
              ),
              SizedBox(height: 50,),
              Text("Ways to Plan With Safe Drive",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),),
              SizedBox(height: 30,),
              GestureDetector(
                onTap: () {
                  UtilFunction.navigateTo(context, CameraScreen());
                },
                child: Container(
                  child: Column(
                    children: [
                      Image(image: AssetImage("assets/images/drive.png"),
                        height: 250,
                        width: 250,
                      ),
                      Text("Start Journey", style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ],
                  ),
                  height: 300,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Color(0xffFAFAFA),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24,),
              Container(
                child: Column(
                  children: [
                    Image(image: AssetImage("assets/images/test.png"),
                      height: 250,
                      width: 250,
                    ),
                    Text("Fatigue Test", style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ],
                ),
                height: 300,
                width: 350,
                decoration: BoxDecoration(
                    color: Color(0xffFAFAFA),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      )
                    ]
                ),

              ),
              SizedBox(height: 24,),
              Container(
                child: Column(
                  children: [
                    Image(image: AssetImage("assets/images/restshop.png"),
                      height: 250,
                      width: 250,
                    ),
                    Text("Nearest Rest Shop", style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ],
                ),
                height: 300,
                width: 350,
                decoration: BoxDecoration(
                    color: Color(0xffFAFAFA),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      )
                    ]
                ),

              ),

              SizedBox(height: 24,),
<<<<<<< HEAD
              GestureDetector(
                onTap: (){_navigateToAddContacts(context);},
                child: Container(
                  child: Column(
                    children: [
                      Image(image: AssetImage("assets/emergency.png"),
                        height: 250,
                        width: 250,
                      ),
                      Text("Emergency Contacts",style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ],
                  ),
                  height: 300,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Color(0xffFAFAFA),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        )
                      ]
                  ),
=======
              Container(
                child: Column(
                  children: [
                    Image(image: AssetImage("assets/images/emergency.png"),
                      height: 250,
                      width: 250,
                    ),
                    Text("Emergency Contacts", style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ],
                ),
                height: 300,
                width: 350,
                decoration: BoxDecoration(
                    color: Color(0xffFAFAFA),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      )
                    ]
                ),
>>>>>>> 024f0f7560630ee5bca1693ad4be8c3129fc36c0

                ),
              ),

              SizedBox(height: 24,),
              Container(
                child: Column(
                  children: [
                    Image(image: AssetImage("assets/images/history.png"),
                      height: 250,
                      width: 250,
                    ),
                    Text("Journey History", style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ],
                ),
                height: 300,
                width: 350,
                decoration: BoxDecoration(
                    color: Color(0xffFAFAFA),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      )
                    ]
                ),

              ),
              SizedBox(height: 25,),
            ],
          ),
        ),
      ),
    );
  }
}

void _navigateToAddContacts(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddContacts()));
}