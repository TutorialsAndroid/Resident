import 'package:flutter/material.dart';

import '../helper/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenPageState();
}

class _ProfileScreenPageState extends State<ProfileScreen> {

  static const String _uploadProfilePhotoIconPath =
      'assets/icons/upload_image.png';
  static const String _accountInfoTitle = 'Account Info';
  static const String _enterNameInputFieldIconPath =
      'assets/icons/name_label.png';
  static const String _enterNameInputFieldHintText = 'Enter name';
  static const String _enterEmailInputFieldIconPath = 'assets/icons/email.png';
  static const String _enterEmailInputFieldHintText = 'Enter email';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _profilePhotoCard(),
          const SizedBox(
            height: 16,
          ),
          //TODO Use SingleChildScrollView
          const Text(
            _accountInfoTitle,
            style: TextStyle(
                fontFamily: Constants.inconsolata,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          _nameInputField(),
          _emailInputField(),
        ],
      ),
    );
  }

  Widget _profilePhotoCard() {
    return Container(
        height: 320,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepOrange, Colors.orangeAccent],
            // Define your gradient colors
            begin: Alignment.topLeft,
            // Define the gradient's starting point
            end: Alignment
                .bottomRight, // Define the gradient's ending point
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      // Shadow color with opacity
                      spreadRadius: 3,
                      // The spread radius
                      blurRadius: 10,
                      // The blur radius
                      offset: const Offset(
                          0, 5), // Offset in x and y direction
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 60, // You can adjust the radius as needed
                  backgroundImage: AssetImage(
                      _uploadProfilePhotoIconPath), // Use your image URL or AssetImage
                ),
              ),
            ],
          ),
        ));
  }

  Widget _nameInputField() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          hintText: _enterNameInputFieldHintText,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              _enterNameInputFieldIconPath,
              height: 20,
              width: 20,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
    );
  }

  Widget _emailInputField() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          hintText: _enterEmailInputFieldHintText,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              _enterEmailInputFieldIconPath,
              height: 20,
              width: 20,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
    );
  }
}
