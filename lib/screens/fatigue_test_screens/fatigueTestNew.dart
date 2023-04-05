import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:quickalert/quickalert.dart';
import 'package:safedrive/screens/home_page_screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  final List<bool> _answers = [false, true, false, true];

  List<bool> get answers => _answers;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizPage3(),
    );
  }
}


//---------------------- QUESTION 3 ----------------------------------------//

class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.close();

    final paint = Paint()..color = color;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class StarPainter extends CustomPainter {
  final Color color;

  StarPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final double halfWidth = size.width / 2.0;
    final double halfHeight = size.height / 2.0;
    final double radius = halfWidth < halfHeight ? halfWidth : halfHeight;
    final double degreesPerPoint = 360.0 / 5;
    final double radiansPerPoint = degreesPerPoint * pi / 180.0;

    double angle = -pi / 2.0;
    double x, y;
    for (int i = 0; i < 10; i++) {
      double correction = i.isEven ? radiansPerPoint / 2 : -radiansPerPoint / 2;
      x = halfWidth + (cos(angle + correction) * radius);
      y = halfHeight + (sin(angle + correction) * radius);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
      angle += radiansPerPoint;
    }
    path.close();

    final paint = Paint()..color = color;
    
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(pi);
    canvas.translate(-size.width / 2, -size.height / 2);

    canvas.drawPath(path, paint);
  }
    
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//count triangles
int countTriangles(List<int> shapes) {
  int count = 0;
  for (int i = 0; i < shapes.length; i++) {
    // Check if the shape is a triangle
    if (shapes[i] == 2) {
      // Check if the triangle is in a valid position
      if (i >= 10 && i % 5 != 0 && i % 5 != 4) {
        // Check if the surrounding shapes form a triangle
        if (shapes[i - 5] == 2 &&
            shapes[i - 6] != 2 &&
            shapes[i - 4] != 2 &&
            shapes[i + 5] != 2 &&
            shapes[i + 6] != 2 &&
            shapes[i + 4] != 2) {
          count++;
        }
      }
    }
  }
  return count;
}

class QuizPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //triangle count
    final List<int> shapes = List.generate(25, (index) {
      final random = Random();
      return random.nextInt(4);
    });
    final int triangles = countTriangles(shapes);
    return MaterialApp(
      home: Scaffold(
        
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            const SizedBox(height: 30.0),
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
                      'Question  03',
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
                'Count the number of Triangles',
                style: TextStyle(color: Color(0xff000730), fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30.0),
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: SizedBox(
                  width: 170,
                  height: 170,
                  child: GridView.builder(
                    itemCount: 25,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      mainAxisSpacing: 15.0,
                      crossAxisSpacing: 15.0,
                    ),
                    itemBuilder: (context, index) {
                      final random = Random();
                      int shapeIndex = random.nextInt(4);
                      switch (shapeIndex) {
                        case 0:
                          return Container(
                            decoration: const BoxDecoration(
                              color: Color(0xff000730),
                              shape: BoxShape.circle,
                            ),
                          );
                        case 1:
                          return Container(
                            decoration: const BoxDecoration(
                              color: Color(0xff000730),
                              shape: BoxShape.rectangle,
                            ),
                          );
                        case 2:
                          return CustomPaint(
                            painter: TrianglePainter(
                              color: const Color(0xff000730),
                            ),
                          );
                        case 3:
                          return CustomPaint(
                            painter: StarPainter(
                              color: const Color(0xff000730),
                            ),
                          );
                      }
                       return Container();
                    },
                  ),
                ),
              ),
              const SizedBox( height: 25.0 ),
              Row(
                  children: [
                    const Text(
                      'Triangles : ',
                      style: TextStyle(color: Color(0xff000730), fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                    
                    const Expanded(
                      child: TextField(
                        
                        decoration: InputDecoration(
                          hintText: 'Your answer',
                          
                        ),
                        ),
                      ),
                  ],
                ),
               const SizedBox( height: 40.0 ),
               ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: ElevatedButton(
                   onPressed: () {
                      Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => QuizPage4()),
                       );
                     },
                     style: ElevatedButton.styleFrom(
                        primary: const Color(0xff000730),
                        onPrimary: Colors.white,
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
      ),
    );
  }
}






//---------------------- QUESTION 4 ----------------------------------------//

class QuizPage4 extends StatefulWidget {
  @override
  _QuizPage4State createState() => _QuizPage4State();
}

class _QuizPage4State extends State<QuizPage4> {
  Color _circleColor = const Color.fromARGB(255, 0, 38, 255);

  // Add a bool flag to track whether the user clicked the button on time
  bool _clickedOnTime = false;
  
  @override
  void initState() {
    super.initState();
    // Start a timer to change the color of the circle after 5 seconds
    Timer(const Duration(seconds: 5), () {
      setState(() {
        _circleColor = Colors.yellow;
      });
    // Start another timer to check if the user clicked the button on time
      Timer(const Duration(seconds: 2), () {
        // If the user clicked the button on time, set the corresponding answer to true
        if (_clickedOnTime) {
          MyApp().answers[2] = true;
        }
        // Navigate to the next question
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QuizPage5()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
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
                          MaterialPageRoute(builder: (context) => QuizPage5()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff000730),
                        onPrimary: Colors.white,
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
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30.0),
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
                      'Question  05',
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
                      'What is the number that you memorized?',
                      style: TextStyle(
                        color: Color(0xff000730),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            const SizedBox(height: 60.0),
            TextField(
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                // hintText: 'Enter a 2 digit number',
                hintStyle: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[300],
                ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10.0),
              ),
              maxLength: 2,
            ),
            const SizedBox(height: 1.0),
            Container(
              height: 5.0,
              decoration: BoxDecoration(
                color: const Color(0xff000730),
                borderRadius: BorderRadius.circular(5.0),
              ),
              width: 100.0,
            ),
            const SizedBox(height: 100.0),
            ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: ElevatedButton(
                   onPressed: () {
                     // Get the value entered by the user in the text field
                      String inputNum = _textFieldController.text;
                     
                     // Convert the entered value to an integer
                      int value = int.tryParse(inputNum) ?? 0;

                      // Check if the entered value is equal to 42
                      if (value == 42) {
                        // Update the answer to true
                        MyApp().answers[3] = true;
                      } else {
                        // Update the answer to false
                        MyApp().answers[3] = false;
                      }
                     
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QuizScore(answers: [false, false, false, true])),
                      );
                     },
                     style: ElevatedButton.styleFrom(
                        primary: const Color(0xff000730),
                        onPrimary: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 15.0),
                      ),
                      child: const Text(
                        'Finish',
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



//---------------------- RESULT SCORE PAGE ----------------------------------------//

class QuizScore extends StatelessWidget {
  final List<bool> answers;
  final int maxScore = 4;
  final double width;
  final double height;

  QuizScore({
    required this.answers,
    this.width = 150.0,
    this.height = 150.0,
  });

  @override
  Widget build(BuildContext context) {
    int score = answers.where((answer) => answer).length;
    double progress = score / 4;

    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30.0),
            const Text(
              'Your Score:',
              style: TextStyle(
                color: Color(0xff000730),
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 60.0),
            SizedBox(
              width: width,
              height: height,
              child: CustomPaint(
                painter: ProgressPainter(progress),
                child: Center(
                  child: Text(
                    '$score',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 120.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizReview()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff000730),
                  onPrimary: Colors.white,
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
    );
  }
}


class ProgressPainter extends CustomPainter {
  final double progress;

  ProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey[300]!
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = min(centerX, centerY) - paint.strokeWidth / 2;

    canvas.drawCircle(Offset(centerX, centerY), radius, paint);

    paint.color = progress >= 0.93 ? const Color(0xff000730) : Colors.grey[300]!;
    double sweepAngle = 2 * pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      paint,
    );

    paint.color = progress < 0.93 ? Colors.red : Colors.grey[300]!;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      -pi / 2 + sweepAngle,
      2 * pi - sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}


//---------------------- RESULT REVIEW PAGE ----------------------------------------//


class QuizReview extends StatelessWidget {
  final List<Map<String, dynamic>> questions = [    {'question': 'Question 01', 'status': '---'},    {'question': 'Question 02', 'status': 'Not Sufficient'},    {'question': 'Question 03', 'status': 'Slow Reaction'},    {'question': 'Question 04', 'status': 'Incorrect'},    {'question': 'Question 05', 'status': 'Correct'},  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            const Center(
              child: Text(
                'Quiz Results',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: DataTable(
                columnSpacing: 50,
                horizontalMargin: 50,
                columns: [
                  const DataColumn(label: Text('Question')),
                  const DataColumn(label: Text('Status')),
                ],
                rows: questions
                    .map((question) => DataRow(cells: [
                          DataCell(Text(question['question'])),
                          DataCell(Text(question['status'])),
                        ]))
                    .toList(),
              ),
            ),
            const SizedBox(height: 80.0),

            Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blueGrey,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: const Text(
                  'You are Fatigued',
                  style: TextStyle(fontSize: 25.0, color: Colors.red),
                ),
              ),
            ),
            const SizedBox(height: 50.0,),

            Center(
              child: SizedBox(
                width: 145.0,
                height: 37.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff000730),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text(
                    'Exit',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
