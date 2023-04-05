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
  String contact = '';
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    readNum();
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
                  child: Center(
                    child: Text(contact,style: TextStyle(fontSize: 22),),
                  ),
                ),
                const SizedBox(height: 10),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              )
                          )
                      ),
                      child: const Text(
                        "Edit",
                        style: TextStyle(fontSize: 15),
                      ),
                      onPressed: () {
                        //sendSMS(message: 'testing', recipients: [contact],sendDirect: true);
                        _navigateToAddContactNum(context);
                      },
                    ),
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
  void readNum() async {
    String contact1 = '';
    DatabaseReference ref = FirebaseDatabase.instance.ref("users").child(user.uid).child("tel");
    Query query = ref;
    DataSnapshot event = await query.get();
    contact1 =  event.value.toString();
    //print(contact1);
    setState(() {
      contact = contact1;
    });
  }
}