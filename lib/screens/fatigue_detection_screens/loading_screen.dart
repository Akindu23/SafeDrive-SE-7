import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safedrive/screens/fatigue_detection_screens/camera_screen.dart';
import 'package:safedrive/utils/util_functions.dart';

class FatigueDetection extends StatefulWidget {
  const FatigueDetection({Key? key}) : super(key: key);

  @override
  State<FatigueDetection> createState() => _FatigueDetectionState();
}

class _FatigueDetectionState extends State<FatigueDetection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "\n" "Let's Start the " "\n" "Journey" "\n",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff000730),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Image(
                      image: AssetImage("assets/images/drive.png"),
                      height: 250,
                      width: 250,
                    ),
                    const Text(
                      "\n" "Did you know ?" "\n",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff000730),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "You are 6 times more likely to end up in an accident if you drive while being fatigued"
                          "\n",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff000730),
                        fontSize: 28,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "It is very important that you get enough rest!",
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
                          UtilFunction.navigateTo(
                              context, const CameraScreen());
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color(0xff000730),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 45.0,
                              vertical: 15.0
                          ),
                        ),
                        child: const Text(
                          'Start Tracking',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xff000730),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 15.0
                  ),
                ),
                child: const Text(
                  'Back',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
