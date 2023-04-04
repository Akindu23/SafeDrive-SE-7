import 'package:flutter/material.dart';

class Question2 extends StatefulWidget {
  const Question2({super.key});

  @override
  State<Question2> createState() => _Question2State();
}

class _Question2State extends State<Question2> {
  get myFocusNode => null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const SizedBox(height: 70.0), // add some space here

            Container(
              alignment: Alignment.topRight,
              child: Container(
                width: 150.0,
                decoration: BoxDecoration(
                  color: const Color(0xff000730),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                alignment: Alignment.centerRight,
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Center(
                    child: Text(
                      'Question  02',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10.0),

            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "\n" 'How many hours did you sleep last night ?' "\n",
                    style: TextStyle(
                      color: Color(0xff000730),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Image(image: AssetImage("assets/images/testFatigue_Q2.png"),
                    height: 250,
                    width: 250,
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextField(
                          focusNode: myFocusNode,
                          style: const TextStyle(fontSize: 25),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Text(
                        "hours",
                        style: TextStyle(
                          color: Color(0xff000730),
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),


                  const SizedBox(height: 50.0),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: ElevatedButton(
                      onPressed: () {
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ()),
                        );*/
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: const Color(0xff000730),
                        padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 15.0),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
