import 'package:flutter/material.dart';
import 'package:formula1app/screens/homepage.dart';
import 'package:formula1app/screens/racing.dart';
import 'package:formula1app/screens/standings.dart';
import 'package:formula1app/screens/latest.dart';
import 'package:formula1app/screens/login.dart';



class Images extends StatefulWidget {
  const Images({super.key});

  @override
  State<Images> createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color.fromARGB(255, 0, 0, 0),
     drawer: Drawer( backgroundColor: const Color.fromARGB(255, 0, 0, 0),

      child: ListView(
         children: [
           const ListTile(
            leading: Icon(Icons.person_2_outlined),
            textColor: Color.fromARGB(255, 255, 0, 0),
            title: Text('Noni Madueke'),
            subtitle: Text('My Account'),
          ),
          const Divider(height: 10,),
           ListTile(
            leading: const Icon(Icons.home),
            textColor: const Color.fromARGB(255, 255, 0, 0),
            title: const Text('Home'),
            onTap: () {
               Navigator.push<void>(
                    context,
                    MaterialPageRoute<void> (
                     builder: (BuildContext context) => const HomePage())
                  );
            },
          ),
          ListTile(
            leading: const Icon(Icons.book_online_rounded),
            textColor: const Color.fromARGB(255, 255, 0, 0),
            title: const Text('Latest'),
            onTap: () {
               Navigator.push<void>(
                    context,
                    MaterialPageRoute<void> (
                     builder: (BuildContext context) => const Latest())
                  );
            },
          ),  
           ListTile(
            leading: const Icon(Icons.outlined_flag_sharp),
             textColor: const Color.fromARGB(255, 255, 0, 0),
            title: const Text('Racing'),
             onTap: () {
              Navigator.push<void>(
                    context,
                    MaterialPageRoute<void> (
                     builder: (BuildContext context) => const Racing())
                  );
            },
          ),
           ListTile(
            leading: const Icon(Icons.headset),
             textColor: const Color.fromARGB(255, 255, 0, 0),
            title: const Text('Standings'),
             onTap: () {
               Navigator.push<void>(
                    context,
                    MaterialPageRoute<void> (
                     builder: (BuildContext context) => const Standings())
                  );
            },
          ),
          const SizedBox(height: 250,),
           ListTile(
            leading: const Icon(Icons.exit_to_app_sharp),
             textColor: const Color.fromARGB(255, 255, 0, 0),
            title: const Text('Log out'),
            onTap: () {
                Navigator.push<void>(
                    context,
                    MaterialPageRoute<void> (
                     builder: (BuildContext context) => const login())
                  );
            },
          ),
        ],
      ),
    ),
    body: Center(
      child: Column(
        children: [
        Image.asset('Images/pexels-abed-ismail-6697875.jpg', height: 200,),
        Image.asset('Images/pexels-bob-ronald-14578740.jpg', height: 200,),
        Image.asset('assets/Images/pexels-carlos-santiago-18541648 (1).jpg', height: 200,)
    ],),
    ),
       appBar: AppBar(
      title: const Text('Images', style: TextStyle(fontSize: 34),),
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 255, 0,0),
      
    ),
   
    );
  }
 }     