import 'package:flutter/material.dart';
import 'package:formula1app/firebase_options.dart';
import 'package:formula1app/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform
);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formula 1 App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:const Color.fromARGB(255, 255, 0, 0)),
        useMaterial3: true,
      ),
      home:const SplashScreen()
    );
  }
}




