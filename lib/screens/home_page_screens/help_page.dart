import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 100),
                const Text(
                  'Guide',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff000730),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                _buildHelpItem(
                  context,
                  '1) How to detect if you are Fatigued',
                  "\nStep 1: Select 'Start Journey' option from home page \n"
                      "\nStep 2: Provide permissions to use devices camera and mic \n"
                      "\nStep 3: Place your phone on a phone holder so that your face is visible \n"
                      "\nStep 4: The app will detect your face and alert you if fatigued \n"
                      "\nStep 5: To stop tracking press the 'Stop Tracking' button \n",
                ),
                const SizedBox(height: 20),
                _buildHelpItem(
                  context,
                  '2) How to find Closest Rest Stops',
                  "\nStep 1: Select 'Nearest Rest Stop' option from home page \n"
                      "\nStep 2: Provide permissions to use devices location \n"
                      "\nStep 3: Select a marker of the rest stop you want to go \n"
                      "\nStep 4: Click on the directions button in the bottom corner \n ",
                ),
                const SizedBox(height: 20),
                _buildHelpItem(
                  context,
                  '3) How to add an Emergency Contact',
                  "\nStep 1: Select 'Emergency Contacts' option from home page \n"
                      "\nStep 2: Enter the contact number of the person you want to add \n"
                      "\nStep 3: Click add to save details \n"
                ),
                const SizedBox(height: 20),
                _buildHelpItem(
                  context,
                  '4) How to check if you are fatigued before driving',
                  "\nStep 1: Select 'Fatigue Test' option from home page \n"
                      "\nStep 2: You will be directed to a small quiz \n"
                      "\nStep 3: Complete the quiz which is based on IQ and Reaction time to determine if you are fatigued \n",
                ),
              ],
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xff000730),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
              ),
              child: const Text(
                'Back',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpItem(
      BuildContext context, String title, String description) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff000730),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
