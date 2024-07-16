import 'package:flutter/material.dart';

import '../helper/constants.dart';
import '../res/colors.dart';

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
  static const String _pinCodeIconPath = 'assets/icons/zip_code.png';
  static const String _stateIconPath = 'assets/icons/usa.png';
  static const String _cityIconPath = 'assets/icons/street.png';
  static const String _buildingNameInputFieldHintText =
      'House No., Building Name (Required)*';
  static const String _roadNameInputFieldHintText =
      'Road name, Area, Colony (Required)*';
  static const String _buildingNameInputFieldIconPath =
      'assets/icons/building.png';
  static const String _roadNameInputFieldIconPath = 'assets/icons/road.png';
  static const String _enterStateInputFieldHintText = 'State';
  static const String _enterCityInputFieldHintText = 'City';
  static const String _enterPinCodeInputFieldHintText = 'Pin code';
  static const String _getLocationBtnText = 'Get location';
  static const String _proceedBtnText = 'Proceed';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _profilePhotoCard(),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    _accountInfoTitle,
                    style: TextStyle(
                        fontFamily: Constants.inconsolata,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  _nameInputField(),
                  _emailInputField(),
                  const SizedBox(
                    height: 16,
                  ),
                  _equalWidthTextFieldAndButton(),
                  const SizedBox(
                    height: 16,
                  ),
                  _equalWidthTextFields(),
                  _buildingNameInputField(),
                  _roadNameInputField(),
                  const SizedBox(
                    height: 16,
                  ),
                  _proceedButton(),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profilePhotoCard() {
    return Container(
        height: 320,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepOrange, Colors.orangeAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
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
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(_uploadProfilePhotoIconPath),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _nameInputField() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextField(
        textInputAction: TextInputAction.next,
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
      padding: const EdgeInsets.only(top: 16),
      child: TextField(
        textInputAction: TextInputAction.next,
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

  Widget _equalWidthTextFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: TextField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: _enterStateInputFieldHintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    _stateIconPath,
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: TextField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: _enterCityInputFieldHintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    _cityIconPath,
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _equalWidthTextFieldAndButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: TextField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: _enterPinCodeInputFieldHintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    _pinCodeIconPath,
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.location_on), // Use the location icon
                label: const Text(_getLocationBtnText),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8.0), // Adjust the value to change the roundness
                    ),
                  ),
                ),
              )),
        ),
      ],
    );
  }

  Widget _buildingNameInputField() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextField(
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: _buildingNameInputFieldHintText,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              _buildingNameInputFieldIconPath,
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

  Widget _roadNameInputField() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextField(
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: _roadNameInputFieldHintText,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              _roadNameInputFieldIconPath,
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

  Widget _proceedButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(1, 0, 1, 6),
      child: SizedBox(
        width: double.infinity,
        child: MaterialButton(
          color: AppColors.secondaryColor,
          padding: const EdgeInsets.all(16.0),
          elevation: 6,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                18.0), // Adjust the radius value as needed
          ),
          child: const Text(
            _proceedBtnText,
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
}
