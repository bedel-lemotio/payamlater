import 'package:flutter/material.dart';
import 'package:payamlater/presentation/features/authentication/views/auth.dart';

import '../../../../widgets/snackbar.dart';

class ForgotEmail extends StatefulWidget {
  const ForgotEmail({Key? key}) : super(key: key);

  @override
  _ForgotEmailState createState() => _ForgotEmailState();
}

class _ForgotEmailState extends State<ForgotEmail> {
  TextEditingController loginEmailController = TextEditingController();

  final FocusNode focusNodeEmail = FocusNode();

  bool _obscureTextPassword = true;

  @override
  void dispose() {
    focusNodeEmail.dispose();
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
          Padding(
            padding:  EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height / 6 , left: 25.0, right: 25.0),
            child: TextField(
              focusNode: focusNodeEmail,
              controller: loginEmailController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(
                  fontFamily: 'WorkSansSemiBold',
                  fontSize: 18.0,
                  color: Colors.black),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(
                      width: 2, color: Color(0xFF034A8F)),
                  // borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(
                      width: 2, color: Color(0xFF034A8F)),
                  // borderRadius: BorderRadius.circular(15),
                ),
                hintText: 'Enter your email',
                hintStyle: TextStyle(
                    fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
              ),
              onSubmitted: (_) {
                // focusNodePassword.requestFocus();
              },
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
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
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                          Auth()), (Route<dynamic> route) => false);

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

  void _toggleLogin() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }
}
