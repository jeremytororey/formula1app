import 'dart:async';
import 'package:flutter/material.dart';
import 'package:formula1app/screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(
       MaterialPageRoute(builder: (context) => const login()), 
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('icons/apple-touch-icon.png'),
            const SizedBox(height:100),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}