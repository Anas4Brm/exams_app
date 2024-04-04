// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quiz_app/data/user_data.dart';
//import 'package:quiz_app/data/user_data.dart';
import 'package:quiz_app/inscription.dart';
//import 'package:quiz_app/Model/user.dart';
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

  /*Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      final String email = _emailController.text;
      final String password = _mdpController.text;

      // Fetch the user from UserData based on email
      final User? user = await UserData.getUserByEmail(email);

      if (user != null && user.password == password) {
        // Successfully logged in
        await UserData.setLoggedInUser(user); // Set the logged-in user
        Navigator.pushReplacementNamed(
            context, '/accueil'); // Navigate to home page
      } else {
        // Handle invalid credentials (e.g., show an error message)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email ou mot de passe incorrect')),
        );
      }
    }
  }*/
  @override
  void dispose() {
    _emailController.dispose();
    _mdpController.dispose();
    super.dispose();
  }

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
              'assets/images/connexionPic.PNG',
              fit: BoxFit.cover,
            ),
          ),
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
                        keyboardType: TextInputType.emailAddress,
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
                        onPressed: //_login,
                            () {
                          if (_formKey.currentState!.validate()) {
                            final email = _emailController.text;
                            final password = _mdpController.text;
                            _handleLogin(email, password);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Connexion réussie'),
                                  backgroundColor: Colors.green,),
                            );

                            Navigator.pushReplacementNamed(context, '/accueil');
                          }
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

  /*void _handleLogin(String email, String password) async {
    print("email= $email password= $password");
    final user = UserData.getUserByEmail(email);
    if (user != null && user.password == password) {
      await UserData.setLoggedInUser(user);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Accueil(loggedInUser: user)),
      ); // Replace '/accueil' with your home page route
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email ou mot de passe incorrect.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }*/
  void _handleLogin(String email, String password)  {
    print("email= $email password= $password");
    final user = UserData.getUserByEmail(email);
    if (user != null && user.password == password) {
      //await UserData.setLoggedInUser(user);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Accueil(loggedInUser: user)),
      ); // Replace '/accueil' with your home page route
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email ou mot de passe incorrect.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

extension EmailValidator on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");
    return emailRegExp.hasMatch(this);
  }
}
