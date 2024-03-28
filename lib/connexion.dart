// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quiz_app/inscription.dart';

import 'acceuil.dart';

class Connexion extends StatefulWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _mdpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 177, 230, 255),
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/images/connexionPic.png',
              fit: BoxFit.cover,
            ),
          ),
          //Image.asset(
          // 'assets/images/connexionPic.png',
          //  fit: BoxFit.cover,

          //  height: MediaQuery.of(context).size.height / 2,
          //),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            child: Text(
              'Connexion',
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 20.0,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.grey[700]),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'L\'email est obligatoire';
                          }
                          if (!RegExp(r'^.+@[a-zA-Z]+\.[a-zA-Z]+$')
                              .hasMatch(value)) {
                            return 'Veuillez entrer une adresse email valide';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _mdpController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Mot de passe',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 97, 97, 97)),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _mdpController.text.isEmpty
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              // setState(() {
                              //  _mdpController.obscureText =
                              //     !_mdpController.obscureText;
                              //});
                            },
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Le mot de passe est obligatoire';
                          }
                          if (value.length < 8) {
                            return 'Le mot de passe doit contenir au moins 8 caractères';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          // if (_formKey.currentState!.validate()) {

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Connexion réussie')),
                          );
                          // TODO: Rediriger vers la page d'accueil
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Accueil()),
                          );
                          //Navigator.pushReplacementNamed(context, '/accueil');
                          // }
                        },
                        child: Text('Se connecter'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15.0),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          // page mot de passe oublié
                        },
                        child: const Text('Mot de passe oublié ?',
                            style: TextStyle(color: Colors.blue)),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Vous n\'avez pas de compte? ',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Inscription()),
                              );
                            },
                            child: Text(
                              'S\'inscrire',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
