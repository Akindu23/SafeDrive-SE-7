import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safedrive/screens/fatigue_test_screens/question_1.dart';

class TestFatigue extends StatefulWidget {
  const TestFatigue({super.key});

  @override
  State<TestFatigue> createState() => _TestFatigueState();
}

class _TestFatigueState extends State<TestFatigue> {
  Widget buildStartBtn(){
    return GestureDetector(
      //onTap: signIn,
      child: Container(
        width: 200,
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
          child: Text("Start",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // SizedBox(height: 0,),
                const Text(
                  "Let's Test Your\nFatigue Level",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff000730),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Image(image: AssetImage("assets/images/testFatigue.png"),
                  height: 250,
                  width: 250,
                ),
                const Text(
                  "Did you know ?" "\n",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff000730),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Fatigue related crashes are twice as likely to be fatal than any other crashes." "\n",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff000730),
                    fontSize: 28,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "You can't brake if you are asleep.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff000730),
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Question1()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: const Color(0xff000730),
                      padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 15.0),
                    ),
                    child: const Text(
                      'Start',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}




