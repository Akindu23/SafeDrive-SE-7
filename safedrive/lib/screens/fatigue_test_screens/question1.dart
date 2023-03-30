import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safedrive/screens/fatigue_test_screens/question2.dart';

class Question1 extends StatefulWidget {
  @override
  _Question1State createState() => _Question1State();
}

class _Question1State extends State<Question1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100.0), // add some space here
            Container(
              alignment: Alignment.topRight,
              child: Container(
                width: 150.0,
                decoration: BoxDecoration(
                  color: Color(0xff000730),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                alignment: Alignment.centerRight,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Center(
                    child: Text(
                      'Question  01',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "\n"+'Memorize this Number'+"\n"+"\n",
                    style: TextStyle(
                      color: Color(0xff000730),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "42",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff000730),
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 100.0),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Question2()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff000730),
                        onPrimary: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 15.0),
                      ),
                      child: Text(
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
