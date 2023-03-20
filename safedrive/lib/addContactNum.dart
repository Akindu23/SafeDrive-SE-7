import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:safedrive/homePage.dart';
import 'AddContacts.dart';

class addContactNum extends StatefulWidget{
  @override
  State<addContactNum> createState() => _addContactNumState();

}

class _addContactNumState extends State<addContactNum>{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final user = FirebaseAuth.instance.currentUser!;
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("users");

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'LK';
  PhoneNumber number = PhoneNumber(isoCode: 'LK');

  bool vali = false;
  late String phnum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Emergency Contact'),
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  phnum = number.phoneNumber!;
                  print(number.phoneNumber);
                },
                onInputValidated: (bool value) {
                  vali = value;
                  print(vali);
                },
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: TextStyle(color: Colors.black),
                initialValue: number,
                textFieldController: controller,
                formatInput: true,
                keyboardType:
                TextInputType.numberWithOptions(signed: true, decimal: true),
                inputBorder: OutlineInputBorder(),
                onSaved: (PhoneNumber number) {
                  print('On Saved: $number');
                },
              ),
              Row(
                children: [
                  const Spacer(flex: 9,),
                  ElevatedButton(
                    onPressed: () async {
                      formKey.currentState?.validate();
                      if (vali){
                        formKey.currentState?.save();
                        //_navigateToAddContacts(context);
                        await ref.set({
                          "email": user.email,
                          "tel": phnum,
                        });
                        _navigateToHomePage(context);
                      }

                    },
                    child: Text('Next'),
                  ),
                  const Spacer(flex: 1,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToHomePage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => homePage()));
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
    await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}