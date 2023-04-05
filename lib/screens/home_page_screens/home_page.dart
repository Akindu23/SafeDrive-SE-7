import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safedrive/screens/fatigue_detection_screens/camera_screen.dart';
import 'package:safedrive/screens/fatigue_test_screens/test_fatigue.dart';
import 'package:safedrive/screens/home_page_screens/help_page.dart';
import 'package:safedrive/screens/maps_screen/maps_screen.dart';
import 'package:safedrive/utils/util_functions.dart';
import '../emergency_contacts_screens/add_contacts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 250),
                  child:
                    Icon(
                    Icons.account_circle_rounded,
                    size: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: MaterialButton(
                        onPressed: (){
                          UtilFunction.navigateTo(context, const HelpPage());
                        },
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        color: const Color(0xff000730),
                        child: const Text(
                          "Help",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          user.email!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                          },
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          color: const Color(0xff000730),
                          child: const Text(
                            "Sign Out",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ], // add closing bracket here
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),
              const Text(
                "Ways to Plan With Safe Drive",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  UtilFunction.navigateTo(context, const CameraScreen());
                },
                child: Container(
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                    color: const Color(0xffFAFAFA),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Column(
                    children: const [
                      Image(
                        image: AssetImage("assets/images/drive.png"),
                        height: 250,
                        width: 250,
                      ),
                      Text(
                        "Start Journey",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Drive with Safe Drive and ensure  your safety while traveling.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  UtilFunction.navigateTo(context, const RestStopScreen());
                },
                child: Container(
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                      color: const Color(0xffFAFAFA),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Column(
                    children: const [
                      Image(
                        image: AssetImage("assets/images/restshop.png"),
                        height: 250,
                        width: 250,
                      ),
                      Text(
                        "Nearest Rest Stop",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Take a Rest and be fresh before driving.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  _navigateToAddContacts(context);
                },
                child: Container(
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                      color: const Color(0xffFAFAFA),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Column(
                    children: const [
                      Image(
                        image: AssetImage("assets/images/emergency.png"),
                        height: 250,
                        width: 250,
                      ),
                      Text(
                        "Emergency Contacts",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Emergency contacts are more important when you are in trouble.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  UtilFunction.navigateTo(context, const TestFatigue());
                },
                child: Container(
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                      color: const Color(0xffFAFAFA),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Column(
                    children: const [
                      Image(
                        image: AssetImage("assets/images/test.png"),
                        height: 250,
                        width: 250,
                      ),
                      Text(
                        "Fatigue Test",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Test your Fatigue Level before driving.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _navigateToAddContacts(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const AddContacts()));
}
