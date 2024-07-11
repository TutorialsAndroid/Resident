import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resident/helper/utility.dart';

import '../res/colors.dart';
import '../res/strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 23.0,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _phoneNumberInputField(),
            _loginButton(),
            const SizedBox(height: 6,)
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _phoneNumberInputField() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: Strings.loginScreenInputFieldHint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: AppColors.secondaryColor),
          ),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 6),
      child: SizedBox(
        width: double.infinity,
        child: MaterialButton(
          color: AppColors.secondaryColor,
          padding: const EdgeInsets.all(16.0),
          elevation: 6,
          onPressed: () {
            // TODO: Handle logic of login
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0), // Adjust the radius value as needed
          ),
          child: const Text(
            Strings.loginScreenBtnText,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _verifyPhoneNumber(String number) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: (PhoneAuthCredential credential) {
        Utility.logMessage('verification completed');
      },
      verificationFailed: (FirebaseAuthException e) {
        Utility.logMessage('verification failed');
      },
      codeSent: (String verificationId, int? resendToken) {
        Utility.logMessage('code sent');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        Utility.logMessage('code auto retrieval time-out');
      },
    );
  }
}