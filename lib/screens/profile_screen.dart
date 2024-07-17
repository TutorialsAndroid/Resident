import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:resident/helper/utility.dart';
import 'package:resident/screens/home_page.dart';

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

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _buildingNameController = TextEditingController();
  final TextEditingController _roadNameController = TextEditingController();

  bool _nameValid = true;
  bool _emailValid = true;
  bool _pinCodeValid = true;
  bool _stateValid = true;
  bool _cityValid = true;
  bool _buildingNameValid = true;
  bool _roadNameValid = true;

  File? _imageFile;
  double _uploadProgress = 0.0;
  bool _isUploading = false;
  String _profilePhotoURL =
      'https://firebasestorage.googleapis.com/v0/b/resident-society.appspot.com/o/profile_images%2Fuser.png?alt=media&token=3a03f9f4-9be8-4d62-b305-7c95528b9353';

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
    return GestureDetector(
      onTap: () {
        _requestGalleryPermission(); // Call method to pick image on tap
      },
      child: Container(
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
                child: _imageFile != null
                    ? _profilePhotoFromFile()
                    : _profilePhotoFromAssets(),
              ),
              const SizedBox(
                height: 16,
              ),
              _isUploading
                  ? SizedBox(
                      width: 80,
                      child: Column(
                        children: [
                          LinearProgressIndicator(
                            value: _uploadProgress,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            getProgressPercentage(_uploadProgress),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ))
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profilePhotoFromAssets() {
    return const CircleAvatar(
      radius: 60,
      backgroundImage: AssetImage(_uploadProfilePhotoIconPath),
    );
  }

  Widget _profilePhotoFromFile() {
    return CircleAvatar(
      radius: 60,
      backgroundImage: FileImage(_imageFile!),
    );
  }

  Widget _nameInputField() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextField(
        controller: _nameController,
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
          errorText: _nameValid ? null : 'Name required*',
        ),
        onChanged: (value) {
          setState(() {
            _nameValid = value.isNotEmpty; // Update validation state
          });
        },
      ),
    );
  }

  Widget _emailInputField() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextField(
        controller: _emailController,
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
          errorText: _emailValid ? null : 'Email required*',
        ),
        onChanged: (value) {
          setState(() {
            _emailValid = value.isNotEmpty; // Update validation state
          });
        },
      ),
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
              controller: _pinCodeController,
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
                errorText: _pinCodeValid ? null : 'PinCode required*',
              ),
              onChanged: (value) {
                setState(() {
                  _pinCodeValid = value.isNotEmpty; // Update validation state
                });
              },
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

  Widget _equalWidthTextFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: TextField(
              controller: _stateController,
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
                errorText: _stateValid ? null : 'State required*',
              ),
              onChanged: (value) {
                setState(() {
                  _stateValid = value.isNotEmpty; // Update validation state
                });
              },
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
              controller: _cityController,
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
                errorText: _cityValid ? null : 'City required*',
              ),
              onChanged: (value) {
                setState(() {
                  _cityValid = value.isNotEmpty; // Update validation state
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildingNameInputField() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextField(
        controller: _buildingNameController,
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
          errorText: _buildingNameValid ? null : 'Building name required*',
        ),
        onChanged: (value) {
          setState(() {
            _buildingNameValid = value.isNotEmpty; // Update validation state
          });
        },
      ),
    );
  }

  Widget _roadNameInputField() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextField(
        controller: _roadNameController,
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
          errorText: _roadNameValid ? null : 'Road name required*',
        ),
        onChanged: (value) {
          setState(() {
            _roadNameValid = value.isNotEmpty; // Update validation state
          });
        },
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
          onPressed: () {
            setState(() {
              _nameValid = _nameController.text.isNotEmpty;
              _emailValid = _emailController.text.isNotEmpty;
              _pinCodeValid = _pinCodeController.text.isNotEmpty;
              _stateValid = _stateController.text.isNotEmpty;
              _cityValid = _cityController.text.isNotEmpty;
              _buildingNameValid = _buildingNameController.text.isNotEmpty;
              _roadNameValid = _roadNameController.text.isNotEmpty;
            });
            if (_nameValid &&
                _emailValid &&
                _pinCodeValid &&
                _stateValid &&
                _cityValid &&
                _buildingNameValid &&
                _roadNameValid) {
              // All fields are valid, proceed to save data
              _updateUser(
                _nameController.text,
                _profilePhotoURL,
                _emailController.text,
                _pinCodeController.text,
                _stateController.text,
                _cityController.text,
                _buildingNameController.text,
                _roadNameController.text,
              );
            }
          },
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

  Future<void> _updateUser(
      String name,
      String photoURL,
      String email,
      String pinCode,
      String state,
      String city,
      String buildingName,
      String roadName) async {
    User? user = FirebaseAuth.instance.currentUser;

    await user?.updateDisplayName(name);
    await user?.updatePhotoURL(photoURL);

    _saveDataToDatabase(
      _nameController.text,
      _emailController.text,
      _pinCodeController.text,
      _stateController.text,
      _cityController.text,
      _buildingNameController.text,
      _roadNameController.text,
    );
  }

  Future<void> _saveDataToDatabase(String name, String email, String pinCode,
      String state, String city, String buildingName, String roadName) async {
    DatabaseReference dbRef =
        FirebaseDatabase.instance.ref(Constants.registeredUsers);
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await dbRef.child(user.uid).set({
        "name": name,
        "email": email,
        "address": {
          "pinCode": pinCode,
          "state": state,
          "city": city,
          "buildingName": buildingName,
          "roadName": roadName
        }
      });

      _showHomePage();
    }
  }

  void _showHomePage() {
    Navigator.pop(context);
    // Navigate to a new screen or perform any other action here
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  // Check and request permission
  Future<void> _requestGalleryPermission() async {
    if (await Permission.photos.request().isGranted) {
      // Permission is granted
      _pickImage(); // Proceed with image picking
    } else {
      // Permission not granted, handle accordingly
      // You might want to show an explanation or disable functionality
    }
  }

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _imageFile = File(pickedImage.path);
        // Upload image to Firebase Storage
        _uploadImageToFirebaseStorage2();
      } else {
        Utility.logMessage('No image selected.');
      }
    });
  }

  @Deprecated(
      "use _uploadImageToFirebaseStorage2() method. The new method has progress shown while uploading")
  void _uploadImageToFirebaseStorage1() async {
    if (_imageFile != null) {
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child('${DateTime.now().millisecondsSinceEpoch}.jpg');

      await ref.putFile(_imageFile!);

      String downloadURL = await ref.getDownloadURL();
      Utility.logMessage('Download URL: $downloadURL');
      // Handle the download URL as needed (e.g., save it to Firebase Realtime Database)
    }
  }

  void _uploadImageToFirebaseStorage2() async {
    if (_imageFile != null) {
      setState(() {
        _isUploading = true;
      });

      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child('${DateTime.now().millisecondsSinceEpoch}.jpg');

      firebase_storage.UploadTask uploadTask = ref.putFile(_imageFile!);

      uploadTask.snapshotEvents
          .listen((firebase_storage.TaskSnapshot snapshot) {
        setState(() {
          _uploadProgress = snapshot.bytesTransferred / snapshot.totalBytes;
        });
      });

      firebase_storage.TaskSnapshot taskSnapshot =
          await uploadTask.whenComplete(() => {});
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      Utility.logMessage('Download URL: $downloadURL');
      _profilePhotoURL = downloadURL;
      // Handle the download URL as needed (e.g., save it to Firebase Realtime Database)

      setState(() {
        _isUploading = false;
      });
    }
  }

  String getProgressPercentage(double progress) {
    return '${(progress * 100).toStringAsFixed(2)}%';
  }
}
