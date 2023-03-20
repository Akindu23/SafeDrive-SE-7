import 'package:flutter/material.dart';

class AddContacts extends StatefulWidget {
  @override
  _AddContactsState createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Emergency contact'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children:  <Widget>[
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //labelText: 'Name',
                      //hintText: 'Enter Your Name',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //labelText: 'Emergency number',
                      //hintText: 'Enter Number',
                    ),
                  ),
                ),
                // Padding(padding: EdgeInsets.all(15),
                //   child: ButtonBar(children: <Widget>[
                //     TextButton(onPressed: (){}),
                //     child: Text("Add"))
                //   ],),
                // )

                Row(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                // side: const BorderSide(color: Colors.red)
                              )
                          )
                      ),
                      child: const Text(
                        "Add",
                        style: TextStyle(fontSize: 15),
                      ),
                      onPressed: (){},
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                // side: const BorderSide(color: Colors.red)
                              )
                          )
                      ),
                      onPressed: (){},
                      child: const Text(
                        "Edit",

                      ),
                    ),


                  ],
                )




              ],
            )
        )
    );
  }
}