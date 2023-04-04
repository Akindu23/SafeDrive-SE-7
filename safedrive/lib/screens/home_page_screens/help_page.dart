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
                  'How to detect if you are Fatigued',
                  'This option will do something really cool',
                ),
                const SizedBox(height: 20),
                _buildHelpItem(
                  context,
                  'How to find Closest Rest Stops',
                  'This option will do something even cooler',
                ),
                const SizedBox(height: 20),
                _buildHelpItem(
                  context,
                  'How to add an Emergency Contact',
                  'This option will do something awesome',
                ),
                const SizedBox(height: 20),
                _buildHelpItem(
                  context,
                  'How to check if you are fatigued before driving',
                  'This option will do something amazing',
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
