import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:resident/firebase_options.dart';
import 'package:resident/screens/home_page.dart';
import 'package:resident/screens/login_screen.dart';
import 'package:resident/screens/otp_screen2.dart';
import 'package:resident/screens/prepaidmeter_screen.dart';
import 'package:resident/screens/profile_screen.dart';
import 'package:resident/screens/rentpay_screen.dart';
import 'package:resident/screens/services_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //Run the app when done initializing
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Strings.appName',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen() //wait
    );
  }
}
