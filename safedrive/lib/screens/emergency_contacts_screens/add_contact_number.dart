import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:safedrive/screens/home_page_screens/home_page.dart';

class AddContactNum extends StatefulWidget{
  const AddContactNum({super.key});

  @override
  State<AddContactNum> createState() => _AddContactNumState();

}

class _AddContactNumState extends State<AddContactNum>{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final user = FirebaseAuth.instance.currentUser!;
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("users");

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'LK';
  PhoneNumber number = PhoneNumber(isoCode: 'LK');

  bool validation = false;
  late String phoneNumber;

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
                  phoneNumber = number.phoneNumber!;
                  // print(number.phoneNumber);
                },
                onInputValidated: (bool value) {
                  validation = value;
                  // print(validation);
                },
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: const TextStyle(color: Colors.black),
                initialValue: number,
                textFieldController: controller,
                formatInput: true,
                keyboardType:
                const TextInputType.numberWithOptions(signed: true, decimal: true),
                inputBorder: const OutlineInputBorder(),
                onSaved: (PhoneNumber number) {
                  // print('On Saved: $number');
                },
              ),
              Row(
                children: [
                  const Spacer(flex: 9,),
                  ElevatedButton(
                    onPressed: () async {
                      formKey.currentState?.validate();
                      if (validation){
                        formKey.currentState?.save();
                        //_navigateToAddContacts(context);
                        /*await ref.set({
                          "email": user.email,
                          "tel": phoneNumber,
                        });*/
                        writeData();
                        // if(context.mounted) {
                        _navigateToHomePage(context);
                        // }
                      }
                    },
                    child: const Text('Done'),
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
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
  }

  void writeData() async{
    final uid = user.uid;
    ref.child(uid).set({
      "email": user.email,
      "id": user.uid,
      "tel": phoneNumber,
    });
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