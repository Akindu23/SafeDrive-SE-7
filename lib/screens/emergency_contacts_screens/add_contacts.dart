import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:quickalert/quickalert.dart';
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
                    child: Text(contact,style: const TextStyle(fontSize: 22),),
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
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF000730)),
                      ),
                      child: const Text(
                        "Add",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      onPressed: () {
                        _navigateToAddContactNum(context);
                      },
                    ),
                    const SizedBox(width: 10), // Add some space between the buttons
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF000730)),
                      ),
                      child: const Text(
                        "Send a Message",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      onPressed: () {
                        sendSMS(
                            message: 'Testing Send SMS Function',
                            recipients: [contact],
                            sendDirect: true
                        );
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.success,
                          text: 'Message sent successfully',
                          confirmBtnText: 'OK',
                          confirmBtnColor: Colors.green,
                        );
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