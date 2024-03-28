// ignore_for_file: unused_field, prefer_const_constructors

import 'package:flutter/material.dart';

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  final _formKey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _emailController = TextEditingController();
  final _filieres = <String>['GI1', 'GI2', 'TM', 'SIR'];
  String? _filiereSelectionnee;
  final _mdpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inscription'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 150.0, // Adjust height as needed
                      width: double.infinity, // Match parent width
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/nsignupPic.PNG'),
                          fit: BoxFit.cover, // Adjust fit for background image
                        ),
                      ),
                    ),
                    /* Positioned(
                      // Position title text
                      bottom: 10.0,
                      left: 10.0,
                      child: const Text(
                        'Inscription',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                        ),
                      ),
                    ),*/
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        controller: _nomController,
                        decoration: InputDecoration(
                          labelText: 'Nom',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: Colors.lightBlue,
                                width: 2.0), // Change border color on focus
                          ),
                          fillColor: Color.fromARGB(255, 238, 238, 238),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Le nom est obligatoire';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Flexible(
                      child: TextFormField(
                        controller: _prenomController,
                        decoration: InputDecoration(
                          labelText: 'Prénom',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: Colors.lightBlueAccent,
                                width: 2.0), // Change border color on focus
                          ),
                          fillColor: Color.fromARGB(255, 238, 238, 238),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Le prénom est obligatoire';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          color: Colors.lightBlueAccent,
                          width: 2.0), // Change border color on focus
                    ),
                    fillColor: Color.fromARGB(255, 238, 238, 238),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'L\'email est obligatoire';
                    }
                    if (!RegExp(r'^.+@[a-zA-Z]+\.[a-zA-Z]+$').hasMatch(value)) {
                      return 'Veuillez entrer une adresse email valide';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text('Filière'),
                    const SizedBox(width: 10),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: '',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: Colors.lightBlueAccent,
                                width: 2.0), // Change border color on focus
                          ),
                          fillColor: Color.fromARGB(255, 238, 238, 238),
                        ),
                        items: _filieres
                            .map((filiere) => DropdownMenuItem(
                                  value: filiere,
                                  child: Text(filiere),
                                ))
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Veuillez sélectionner une filière';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          setState(() {
                            _filiereSelectionnee = value;
                          });
                        },
                        onChanged: (String? value) {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _mdpController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          color: Colors.lightBlueAccent,
                          width: 2.0), // Change border color on focus
                    ),
                    fillColor: Color.fromARGB(255, 238, 238, 238),
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
                    if (_formKey.currentState!.validate()) {
                      // Enregistrer l'utilisateur
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Inscription réussie')),
                      );
                      Navigator.pushNamed(context, '/connexion');
                    }
                  },
                  child: Text('S\'inscrire'),
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
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Vous avez déjà un compte ?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, '/connexion'); // Login route
                      },
                      child: const Text('Se connecter'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
