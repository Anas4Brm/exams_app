// ignore_for_file: unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quiz_app/data/user_data.dart';
import 'package:quiz_app/Model/user.dart';

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
  final _mdpController = TextEditingController();

  @override
  void dispose() {
    _nomController.dispose();
    _prenomController.dispose();
    _emailController.dispose();
    _mdpController.dispose();
    super.dispose();
  }

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
                      height: 150.0, 
                      width: double.infinity, 
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/nsignupPic.PNG'),
                          fit: BoxFit.cover, 
                        ),
                      ),
                    ),
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
                                width: 2.0), 
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
                                width: 2.0), 
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
                          width: 2.0), 
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
                                width: 2.0), 
                          ),
                          fillColor: Color.fromARGB(255, 238, 238, 238),
                        ),
                        items: _filieres
                            .map((filiere) => DropdownMenuItem(
                                  value: filiere,
                                  child: Text(filiere),
                                ))
                            .toList(),
                          value:"GI2",
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
                          width: 2.0), 
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
                    print("nom: ${_nomController.text}");
print("prenom: ${_prenomController.text}");
print("email: ${_emailController.text}");
print("password: ${_mdpController.text}");
                    if (_formKey.currentState!.validate()) {
                      // Save user data
                      final userId = UserData.generateUserId();
                      final user = User(
                        id: userId,
                        nom: _nomController.text,
                        prenom: _prenomController.text,
                        email: _emailController.text,
                        filiere: "GI2",
                        password: _mdpController.text,
                      );
                      UserData.addUser(user);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Inscription réussie'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.pushReplacementNamed(context, '/connexion');
                    }
                  },
                  child: Text('S\'inscrire'),
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
                const Divider(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Vous avez déjà un compte ?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, '/connexion');
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
