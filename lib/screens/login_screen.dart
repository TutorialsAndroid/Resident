import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resident/helper/utility.dart';
import 'package:resident/screens/otp_screen2.dart';

import '../res/colors.dart';
import '../res/strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreen> {
  static const String _loginBgPath = 'assets/images/login_bg.jpg';
  static const String _appIconPath = 'assets/icons/app_icon.png';

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_loginBgPath),
                // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Blur effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: Container(
              color:
                  Colors.black.withOpacity(0.4), // Adjust the opacity as needed
            ),
          ),
          // Your content
          Column(
            children: <Widget>[
              const Spacer(),
              _logo(),
              const SizedBox(
                height: 8,
              ),
              const Text(
                Strings.appName,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'playfair'),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                Strings.loginScreenDesc,
                style: TextStyle(
                    fontSize: 20, color: Colors.white, fontFamily: 'playfair'),
              ),
              const Spacer(),
              const Spacer(),
              _phoneNumberInputField(),
              _loginButton(),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _logo() {
    return Align(
        alignment: Alignment.center,
        child: Image.asset(
          _appIconPath,
          width: 180,
          height: 180,
        ));
  }

  Widget _phoneNumberInputField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _textEditingController,
        keyboardType: TextInputType.phone,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          hintText: Strings.loginScreenInputFieldHint,
          hintStyle: TextStyle(
            color: Colors.white,
          ),
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
            String phoneNumber = _textEditingController.text;
            _verifyPhoneNumber("+91$phoneNumber");
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                18.0), // Adjust the radius value as needed
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
        Navigator.pop(context);
        Utility.openPage(
            context,
            OTPScreen2(
              verificationID: verificationId,
              phoneNumber: number,
            ));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        Utility.logMessage('code auto retrieval time-out');
      },
    );
  }
}
