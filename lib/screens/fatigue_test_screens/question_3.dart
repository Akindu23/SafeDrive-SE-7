import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

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
    const double degreesPerPoint = 360.0 / 5;
    const double radiansPerPoint = degreesPerPoint * pi / 180.0;

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        appBar: AppBar(
          title: const Text('Shapes Grid'),
        ),
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Count the number of Triangles',
                style: TextStyle(color: Color(0xff000730), fontSize: 35.0, fontWeight: FontWeight.bold),
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
                  width: 250,
                  height: 250,
                  child: GridView.builder(
                    itemCount: 25,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 20.0,
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
              const SizedBox( height: 20.0 ),
              Text(
                'Number of triangles: $triangles',
                style: const TextStyle( color: Color(0xff000730), fontSize: 25.0, fontWeight: FontWeight.bold,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}