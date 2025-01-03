import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:to_do_list/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBuQ-dYKSW1w3283PfulWelTNXFmMcULYc",
          appId: "1:378526489682:android:ed79066025290ecfa1138b",
          messagingSenderId: "378526489682",
          projectId: "todoapp-6ac41"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
