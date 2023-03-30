import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Question2 extends StatefulWidget {
  @override
  _Question2State createState() => _Question2State();
}

class _Question2State extends State<Question2> {

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
                    "\n"+'How many hours did you sleep last night ?'+"\n",
                    style: TextStyle(
                      color: Color(0xff000730),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    child: Image(image: AssetImage("assets/images/testFatigue_Q2.png"),
                      height: 250,
                      width: 250,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        //labelText: 'Enter your username',
                      ),
                    ),
                  ),
/*
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Icon(Icons.person,
                              size: 40.0, color: Colors.white),
                        ),
                        hintText: "Input your opinion",
                        hintStyle: TextStyle(color: Colors.white30),
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(new Radius.circular(25.0))),
                        labelStyle: TextStyle(color: Colors.white)),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
*/
                  SizedBox(height: 70.0),
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
