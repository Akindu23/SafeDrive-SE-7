import 'package:flutter/material.dart';
import 'package:safedrive/screens/fatigue_test_screens/fatigueTestNew.dart';

class Question2 extends StatefulWidget {
  const Question2({super.key});

  @override
  State<Question2> createState() => _Question2State();
}

class _Question2State extends State<Question2> {
  get myFocusNode => null;
  final _text = TextEditingController();
  bool _validate = false;
  final TextEditingController _textFieldController = TextEditingController();

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
       child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 100.0), // add some space here
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

            const SizedBox(height: 50.0),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'How many hours did you sleep last night ?',
                    style: TextStyle(
                      color: Color(0xff000730),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Image(image: AssetImage("assets/images/testFatigue_Q2.png"),
                    height: 250,
                    width: 250,
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          controller: _text,
                          decoration: InputDecoration(
                            errorText: _validate ? 'Value Can\'t Be Empty' : null,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                width: 5,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          focusNode: myFocusNode,
                          style: const TextStyle(fontSize: 25),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Text(
                        "hours",
                        style: TextStyle(
                          color: Color(0xff000730),
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40.0),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if(_text.text.isEmpty){
                          setState(() {
                            _text.text.isEmpty ? _validate = true : _validate = false;
                          });
                        } else{
                          // Get the value entered by the user in the text field
                          String inputNum = _textFieldController.text;
                          // Convert the entered value to an integer
                          int value = int.tryParse(inputNum) ?? 0;
                          // Check if the entered value is equal to 42
                          if (value >= 7) {
                            // Update the answer to true
                            MyApp().answers[2] = true;
                          } else if (value < 7) {
                            // Update the answer to false
                            MyApp().answers[2] = false;
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => QuizPage3()),
                          );
                        }
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
      )
    );
  }
    )
    ));
  }
}
