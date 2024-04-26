import 'package:flutter/material.dart';
import 'package:formula1app/screens/homepage.dart';
import 'package:formula1app/screens/register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  }
  
  @override
  Widget build(BuildContext context) {
       return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Padding(
        padding: const EdgeInsets.all(80),
        child: Column(children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('icons/driver.png'),
          ),
          const SizedBox(height: 10,),
             const TextField(style: TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
                decoration: InputDecoration(
                  hintText: 'Enter email or name', hintStyle: TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.horizontal(right: Radius.circular(40), left: Radius.circular(40))
                  )
                ),
              ),
             const SizedBox(height: 10,),
             const TextField(obscureText: true,
              style: TextStyle(color: Color.fromARGB(255, 255, 2, 2)),
                decoration: InputDecoration (
                  hintText: 'Enter password', hintStyle: TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
                 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.horizontal(right: Radius.circular(40), left: Radius.circular(40))
                  )
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                onPressed:(){
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void> (
                     builder: (BuildContext context) => const HomePage())
                  );
                },
               child: const Text("login")),
               const SizedBox(height: 10,),
               RichText(
  text: const TextSpan(
    children: <TextSpan>[
      TextSpan(text: 'Dont have an account?', style: TextStyle(color: Color.fromARGB(255, 255, 0, 0))),
    ],
  ),
),
TextButton(onPressed: (){
         Navigator.push<void>(
                    context,
                    MaterialPageRoute<void> (
                     builder: (BuildContext context) => const register())
                  );
                },
        child: const Text('Register')),
            ],),
      ),
      );
  }
