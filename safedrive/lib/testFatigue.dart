import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safedrive/question3.dart';
import 'package:safedrive/testFatigue_Q1.dart';

class TestFatigue extends StatefulWidget {
  @override
  _TestFatigueState createState() => _TestFatigueState();
}

class _TestFatigueState extends State<TestFatigue> {
  Widget buildStartBtn(){
    return GestureDetector(
      //onTap: signIn,
      child: Container(
        width: 200,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Color(0xff000730),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              )
            ]
        ),
        child: Center(
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
                        "Let's Test Your" +"\n" +"Fatigue Level",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff000730),
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        child: Image(image: AssetImage("assets/images/testFatigue.png"),
                          height: 250,
                          width: 250,
                        ),
                      ),
                      Text(
                        "Did you know ?"+"\n",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff000730),
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Fatigue crashes are twice as likely to be fatal than any other crashes."+"\n",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff000730),
                          fontSize: 28,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "You can't break if you are asleep.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff000730),
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TestFatigue_Q1()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff000730),
                            onPrimary: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 15.0),
                          ),
                          child: Text(
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


class TestFatigue_Q1 extends StatefulWidget {
  @override
  _TestFatigue_Q1State createState() => _TestFatigue_Q1State();
}

class _TestFatigue_Q1State extends State<TestFatigue_Q1> {

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
                          MaterialPageRoute(builder: (context) => TestFatigue_Q2()),
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



