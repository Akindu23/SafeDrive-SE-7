import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'add_contact_number.dart';

class AddContacts extends StatefulWidget {
  const AddContacts({super.key});

  @override
  State<AddContacts> createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
  void readNum() async {
    final user = FirebaseAuth.instance.currentUser!;
    String user1 = user.uid;
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('users').get();
    if (snapshot.exists) {
      print(snapshot.value);
      //Object? numForDisplay = snapshot.value;
    } else {
      print('No data available.');
    }
  }

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
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: const Center(
                    child: Text('Enter Contact Number'),
                  ),
                ),
                const SizedBox(height: 10),
                /*const Padding(
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
                ),*/
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
                        "Edit",
                        style: TextStyle(fontSize: 15),
                      ),
                      onPressed: (){
                        _navigateToAddContactNum(context);
                      },
                    ),
                    /*const SizedBox(width: 10),
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
                    ),*/


                  ],
                )




              ],
            )
        )
    );
  }
  void _navigateToAddContactNum(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddContactNum()));
  }
}