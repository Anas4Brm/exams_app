// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'acceuil.dart';
import 'inscription.dart';
import 'connexion.dart';
//import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/inscription': (context) => const Inscription(),
        '/connexion': (context) => const Connexion(),
        '/accueil': (context) => const Accueil(),
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 7,
              child: Image.asset(
                "assets/images/splashPic.PNG",
              ),
            ),
            //const SizedBox(height: 2),
            const Text(
              'IPASS',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            //Image.asset('assets/images/splashPic.PNG'),
            const SizedBox(height: 10),
            const Text(
              'L\'examen en ligne réinventé\n Simplicité et performance garanties !',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/inscription');
                  },
                  child: const Text('S\'inscrire'),
                  style: ElevatedButton.styleFrom(
                    // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0), // Adjust padding
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/connexion');
                  },
                  child: const Text('Se connecter'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0), // Adjust padding
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
