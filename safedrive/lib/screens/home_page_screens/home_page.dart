import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safedrive/screens/fatigue_detection_screens/camera_screen.dart';
import 'package:safedrive/screens/fatigue_test_screens/test_fatigue.dart';
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
                height: 25,
              ),
              Text("sign in as ${user.email!}"),
              MaterialButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                color: Colors.blue,
                child: const Text("sign out"),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Ways to Plan With Safe Drive",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  UtilFunction.navigateTo(context, const CameraScreen());
                },
                child: Container(
                  height: 300,
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
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  UtilFunction.navigateTo(context, TestFatigue());
                },
                child: Container(
                  height: 300,
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
                  height: 300,
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
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: (){_navigateToAddContacts(context);},
                child: Container(
                  height: 300,
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
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              // Container(
              //   child: Column(
              //     children: [
              //       Image(
              //         image: AssetImage("assets/images/history.png"),
              //         height: 250,
              //         width: 250,
              //       ),
              //       Text(
              //         "Journey History",
              //         style: TextStyle(
              //           fontSize: 22,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //     ],
              //   ),
              //   height: 300,
              //   width: 350,
              //   decoration: BoxDecoration(
              //       color: Color(0xffFAFAFA),
              //       borderRadius: BorderRadius.circular(20),
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.black26,
              //           blurRadius: 6,
              //           offset: Offset(0, 2),
              //         )
              //       ]),
              // ),
              // SizedBox(
              //   height: 25,
              // ),
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