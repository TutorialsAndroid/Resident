import 'package:flutter/material.dart';
import 'package:resident/helper/utility.dart';

import '../res/colors.dart';

class OTPScreen2 extends StatefulWidget {
  const OTPScreen2({super.key});

  @override
  State<OTPScreen2> createState() => _OTPScreen2PageState();
}

class _OTPScreen2PageState extends State<OTPScreen2> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

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
            'assets/images/pin.png',
            height: 180,
            width: 180,
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        const Text(
          'Enter  your\nVerification Code',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.verified_outlined),
            SizedBox(
              width: 5,
            ),
            Text('Enter OTP Sent on +919923936753',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
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
                "Didn't get it?",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: Container(
                    width: 130,
                    height: 30,
                    decoration: BoxDecoration(
                      // color: Colors.grey[200], // Set your desired background color here
                      borderRadius: BorderRadius.circular(10),
                      // Rounded corners
                      border: Border.all(
                        color: AppColors.secondaryColor,
                        // Set the border color
                        width: 1.5, // Set the border width
                      ),
                    ),
                    child: const Center(
                      child: Text('Resend Code'),
                    )))
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
            //TODO Verify the OTP
            String otp = _getOTP();
            Utility.logMessage(otp);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                18.0), // Adjust the radius value as needed
          ),
          child: const Text(
            'Verify OTP',
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
}
