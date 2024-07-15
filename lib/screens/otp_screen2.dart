import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resident/helper/utility.dart';
import 'package:resident/screens/profile_screen.dart';

import '../res/colors.dart';

class OTPScreen2 extends StatefulWidget {
  const OTPScreen2(
      {super.key, required this.verificationID, required this.phoneNumber});

  final String verificationID;
  final String phoneNumber;

  @override
  State<OTPScreen2> createState() => _OTPScreen2PageState();
}

class _OTPScreen2PageState extends State<OTPScreen2> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  static const String _iconPath = 'assets/icons/pin.png';
  static const String _title1 = 'Enter  your\nVerification Code';
  static const String _resendCode1 = "Didn't get it?";
  static const String _resendCode2 = 'Resend Code';
  static const String _verifyOTPBtnText = 'Verify OTP';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      scrollDirection: Axis.vertical,
      children: [
        const SizedBox(height: 160),
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            _iconPath,
            height: 180,
            width: 180,
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        const Text(
          _title1,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.verified_outlined),
            const SizedBox(
              width: 5,
            ),
            Text('Enter OTP Sent on ${widget.phoneNumber}',
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(6, (index) {
            return _buildOTPField(index);
          }),
        ),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 6, 0),
              child: Text(
                _resendCode1,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: GestureDetector(
                onTap: () {
                  _resendCode(widget.phoneNumber);
                },
                child: Container(
                  width: 130,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.secondaryColor,
                      width: 1.5,
                    ),
                  ),
                  child: const Center(
                    child: Text(_resendCode2),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 18,
        ),
        _loginButton(),
      ],
    ));
  }

  Widget _buildOTPField(int index) {
    return Container(
      width: 50,
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.grey[200], // Set your desired background color here
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: Center(
        child: TextField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          style: const TextStyle(fontSize: 24),
          decoration: const InputDecoration(
            counterText: "",
            border: InputBorder.none,
          ),
          onChanged: (value) {
            if (value.length == 1 && index < 5) {
              _focusNodes[index + 1].requestFocus();
            }
            if (value.isEmpty && index > 0) {
              _focusNodes[index - 1].requestFocus();
            }
          },
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
            String otp = _getOTP();
            Utility.logMessage(otp);
            _verifyOTP(otp);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                18.0), // Adjust the radius value as needed
          ),
          child: const Text(
            _verifyOTPBtnText,
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

  String _getOTP() {
    String otp = "";
    for (var controller in _controllers) {
      otp += controller.text;
    }
    return otp;
  }

  Future<void> _verifyOTP(String otpCode) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verificationID, smsCode: otpCode);

      // Sign the user in (or link) with the credential
      UserCredential userCredential =
          await auth.signInWithCredential(credential);

      // If the above line doesn't throw, the sign-in was successful
      Utility.logMessage("Successfully signed in: ${userCredential.user}");
      // You can now navigate to the next screen or show a success message
      _navigateToProfileScreen();
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

  Future<void> _resendCode(String number) async {
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

  void _navigateToProfileScreen() {
    Navigator.pop(context);
    Utility.openPage(context, const ProfileScreen());
  }
}
