import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:formula1app/screens/homepage.dart';
import 'package:formula1app/screens/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerstate();
}

class _registerstate extends State<register> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  Future<void> _register() async {
    var snackBar = SnackBar(content: Text(""));
    if (passwordController.text != confirmPasswordController.text) {
      snackBar = SnackBar(content: Text('Passwords do not match'));
      return;
    } 
    if (_formkey.currentState!.validate()) {
      UserCredential userCredential = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
      await FirebaseFirestore.instance
      .collection('users')
      .doc(userCredential.user!.uid)
      .set({
        'email': emailController.text,
      });
      snackBar = SnackBar
    (content: Text('Registration successful'));
    backgroundColor: Color.fromARGB(255, 14, 255, 2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Padding(
        padding: const EdgeInsets.all(60),
        child: Column(
          children: [
           Form(
            key: _formkey,
            child: Column(children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('icons/driver.png'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              style: const TextStyle(color: Color.fromARGB(255, 253, 2, 2)),
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Enter name',
                hintStyle: TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(40),
                      left: Radius.circular(40)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
               controller: emailController,
               validator: (value) => EmailValidator.validate(value!)
               ? null
               : "Please enter a valid email",
              style: const TextStyle(color: Color.fromARGB(255, 253, 2, 2)),
              decoration: const InputDecoration(
                hintText: 'Enter email',
                hintStyle: TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(40),
                      left: Radius.circular(40)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              validator: (String? value) {
                return (value == null) ? 'Please enter password' : null;
              },
              obscureText: true,
              style: const TextStyle(color: Color.fromARGB(255, 253, 2, 2)),
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Enter password',
                hintStyle: TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(40),
                      left: Radius.circular(40)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
               validator: (String? value) {
                return (value == null) ? 'Please comfirm password' : null;
              },
              obscureText: true,
              style: const TextStyle(color: Color.fromARGB(255, 253, 2, 2)),
              controller: confirmPasswordController,
              decoration: const InputDecoration(
                hintText: 'Confirm password',
                hintStyle: TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(40),
                      left: Radius.circular(40)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
               MaterialPageRoute(builder: (BuildContext context)=> const HomePage()) );
              },
              child: const Text("Register"),
            ),
             const SizedBox(height: 10,),
               RichText(
  text: const TextSpan(
    children: <TextSpan>[
      TextSpan(text: 'Already have an account?', style: TextStyle(color: Color.fromARGB(255, 255, 0, 0))),
    ],
  ),
),
            TextButton(
              onPressed: () {
                Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => const login()));
              },
              child: const Text('Login'),
            ),
            ])
           ),
          ],
        ),
      ),
    );
  }
}
