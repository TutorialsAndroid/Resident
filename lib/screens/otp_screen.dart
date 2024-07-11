import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resident/helper/utility.dart';

import '../res/colors.dart';
import '../res/strings.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen(
      {super.key,
      required this.title,
      required this.verificationID,
      required this.phoneNumber});

  final String title;
  final String verificationID;
  final String phoneNumber;

  @override
  State<OTPScreen> createState() => _OTPScreenPageState();
}

class _OTPScreenPageState extends State<OTPScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'playfair'),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16,),
          Align(
            alignment: Alignment.centerLeft,
            child: Image.asset('assets/icons/otp.png', height: 130, width: 130,),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Enter OTP received on ${widget.phoneNumber}',
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'inconsolata'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              controller: _textEditingController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: Strings.otpScreenInputFieldHint,
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
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 6),
            child: SizedBox(
              width: double.infinity,
              child: MaterialButton(
                color: AppColors.secondaryColor,
                padding: const EdgeInsets.all(16.0),
                elevation: 6,
                onPressed: () {
                  String otpCode = _textEditingController.text;
                  _verifyOTP(otpCode);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      18.0), // Adjust the radius value as needed
                ),
                child: const Text(
                  Strings.otpScreenBtnText,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _verifyOTP(String otpCode) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verificationID,
          smsCode: otpCode
      );

      // Sign the user in (or link) with the credential
      UserCredential userCredential = await auth.signInWithCredential(credential);

      // If the above line doesn't throw, the sign-in was successful
      Utility.logMessage("Successfully signed in: ${userCredential.user}");
      // You can now navigate to the next screen or show a success message
    } on FirebaseAuthException catch (e) {
      // If the sign-in failed, a FirebaseAuthException is thrown
      Utility.logMessage("Failed with error code: ${e.code}");
      Utility.logMessage(e.message.toString());
      // Show an error message to the user or handle the error as needed
    } catch (e) {
      // Any other errors are caught here
      Utility.logMessage("An unexpected error occurred: $e");
    }
  }

}
