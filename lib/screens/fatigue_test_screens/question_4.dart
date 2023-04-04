import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuizPage4(),
    );
  }
}



//---------------------- QUESTION 4 ----------------------------------------//

class QuizPage4 extends StatefulWidget {
  const QuizPage4({super.key});

  @override
  State<QuizPage4> createState() => _QuizPage4State();
}

class _QuizPage4State extends State<QuizPage4> {
  Color _circleColor = const Color.fromARGB(255, 0, 38, 255);

  @override
  void initState() {
    super.initState();
    // Start a timer to change the color of the circle after 5 seconds
    Timer(const Duration(seconds: 5), () {
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
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),

      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30.0), // add some space here
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
            const SizedBox(height: 20.0),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Click the Next button when you see the colour change',
                    style: TextStyle(
                      color: Color(0xff000730),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _circleColor,
                    ),
                  ),
                  const SizedBox(height: 70.0),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const QuizPage5()),
                        );
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


//---------------------- QUESTION 5 ----------------------------------------//


class QuizPage5 extends StatelessWidget {
  const QuizPage5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //remove this part - previous page navigation
      appBar: AppBar(
        automaticallyImplyLeading: false, // disable the default back button
        backgroundColor: Colors.white,
        leading:IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),

    );
  }
}

 