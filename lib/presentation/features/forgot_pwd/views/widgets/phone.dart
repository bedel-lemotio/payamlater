import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:payamlater/presentation/features/authentication/views/auth.dart';
import 'package:payamlater/presentation/widgets/snackbar.dart';

import '../../../../widgets/text_field_widget.dart';

class ForgotPhone extends StatefulWidget {
  const ForgotPhone({Key? key}) : super(key: key);

  @override
  _ForgotPhoneState createState() => _ForgotPhoneState();
}

class _ForgotPhoneState extends State<ForgotPhone> {
  TextEditingController loginPhoneController = TextEditingController();

  final FocusNode focusNodePhone = FocusNode();

  bool _obscureTextPassword = true;

  @override
  void dispose() {
    focusNodePhone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 23.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 25.0, right: 25.0),
                      child: TextFieldPhoneWidget(
                        //controller: controller.phoneController,
                        labelText: "Phone number",
                        hintText: "Phone number",
                        messageErro: null,
                        onInputChanged: (PhoneNumber number) {
                          // controller.phoneChanged(number);
                        },
                        onInputValidated:(value){
                          //controller.validationsPhone(value);
                        },
                        onSaved: (PhoneNumber number) {
                          //controller.phoneSaved(number);
                        },
                      ),

                  ),
                ],
              ),
              Container(
                width: 228,
                margin:  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3.2),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  color: Color(0xFF6F8C2E),
                ),
                child: MaterialButton(
                  highlightColor: Colors.transparent,
                  splashColor: Color(0xFF6F8C2E),
                  child: const Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
                    child: Text(
                      'Send Code',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontFamily: 'WorkSansBold'),
                    ),
                  ),
                  onPressed: () => CustomSnackBar(
                      context, const Text('Login button pressed')),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 85.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Remenber Password?',
                  style: TextStyle(
                      color: Color(0xFF034A8F),
                      fontSize: 14.0,
                      fontFamily: 'WorkSansMedium'),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Auth()),
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xFFB3B3B3),
                          fontSize: 14.0,
                          fontFamily: 'WorkSansMedium'),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _toggleSignInButton() {
    CustomSnackBar(context, const Text('Login button pressed'), snackBarAction: null);
  }

  void  _toggleLogin() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }
}
