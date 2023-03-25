import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizPage4(),
    );
  }
}



//---------------------- QUESTION 4 ----------------------------------------//

class QuizPage4 extends StatefulWidget {
  @override
  _QuizPage4State createState() => _QuizPage4State();
}

class _QuizPage4State extends State<QuizPage4> {
  Color _circleColor = Color.fromARGB(255, 0, 38, 255);

  @override
  void initState() {
    super.initState();
    // Start a timer to change the color of the circle after 5 seconds
    Timer(Duration(seconds: 5), () {
      setState(() {
        _circleColor = Colors.yellow;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      //remove this part - previous page navigation
      appBar: AppBar(
        automaticallyImplyLeading: false, // disable the default back button
        backgroundColor: Colors.white,
        leading:IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.0), // add some space here
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
                    'Question  04',
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
                    'Click the Next button when you see the colour change',
                    style: TextStyle(
                      color: Color(0xff000730),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _circleColor,
                    ),
                  ),
                  SizedBox(height: 70.0),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => QuizPage5()),
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


//---------------------- QUESTION 5 ----------------------------------------//


class QuizPage5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      //remove this part - previous page navigation
      appBar: AppBar(
        automaticallyImplyLeading: false, // disable the default back button
        backgroundColor: Colors.white,
        leading:IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      
    );
  }
}
  
 