import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                      Text(
                        "Let's Test Your" +"\n" +"Fatigue Level",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff000730),
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        child: Image(image: AssetImage("assets/testFatigue.png"),
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
                      Text(
                        "You can't break if you are asleep."+"\n",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff000730),
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // ElevatedButton(
                      //   style: ButtonStyle(
                      //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      //           side: BorderSide(width:3, color:Colors.brown),
                      //           RoundedRectangleBorder(
                      //             // borderRadius: BorderRadius.circular(8.0),
                      //             borderRadius: BorderRadius.circular(50),
                      //             // side: const BorderSide(color: Colors.red)
                      //           )
                      //       )
                      //   ),
                      //   child: const Text(
                      //     "Add",
                      //     style: TextStyle(fontSize: 25),
                      //   ),
                      //   onPressed: (){},
                      // ),
                      SizedBox(height: 25,),
                      buildStartBtn(),
                    ],
                  ),
                ),
              )
    //         ],
    //       ),
    //     ),
    //   ),
     );



      // body: Center(
      //     child:Text(
      //         "Let's Test Your Fatigue Level",
      //         style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
      //         textAlign: TextAlign.center,
      //         //Image.asset(name)
      //     )
            // child: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //   SizedBox(height: 50,),
            // Container(
            //   child: Image(image: AssetImage("assets/safedrivelogo.png"),
            //     height: 100,
            //     width: 100,
            //   ),
            // ),
            //   ],
            // )
    //   ),
    // );
  }
}