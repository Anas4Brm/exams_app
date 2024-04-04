// ignore_for_file: prefer_const_uctors, unused_element, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'acceuil.dart';
import 'package:quiz_app/Model/user.dart';
import 'package:quiz_app/data/user_data.dart';
import 'connexion.dart';

class Profile extends StatefulWidget {
 
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _user = User(
    id: 3,
    nom: 'toufik',
    prenom: 'toufik',
    email: 'test@gmail.com',
    filiere: 'GI2',
    password: 'test1234',
  );

  bool _isEditing = false;
    String _nom = '';
  String _prenom = '';
  String _email = '';
  String _filiere = '';

@override
  void initState() {
    super.initState();
    _nom = _user.nom;
    _prenom = _user.prenom;
    _email = _user.email;
    _filiere = _user.filiere;
  }



   void _toggleEditing() {
    setState(() => _isEditing = !_isEditing);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mon profil',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 46, 125, 243),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Accueil()),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile1.png'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Nom'),
                _isEditing
                    ? SizedBox(
                        width: 200,
                        child: TextFormField(
                          initialValue: _nom,
                           onChanged: (value) => setState(() => _nom = value),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          //readOnly: true,
                
                        ),
                      )
                    : Text(_nom),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Prénom'),
                _isEditing
                    ? SizedBox(
                        width: 200,
                        child: TextFormField(
                          initialValue: _prenom,
                          onChanged: (value) => setState(() => _prenom = value),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          
                        ),
                      )
                    : Text(_prenom),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Email'),
                _isEditing
                    ? SizedBox(
                        width: 200,
                        child: TextFormField(
                          initialValue: _email,
                          onChanged: (value) => setState(() => _email= value),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                    
                         
                        ),
                      )
                    : Text(_email),
      
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Filière'),
                _isEditing
                    ? SizedBox(
                        width: 200,
                        child: TextFormField(
                         initialValue: _filiere,
                         onChanged: (value) => setState(() => _filiere = value),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                         
                        ),
                      )
                    : Text(_filiere),
              ],
            ),
            const SizedBox(height: 20),
            _isEditing
                    ? ElevatedButton(
                        onPressed: _toggleEditing,
                        child: const Text('Annuler'),
                      )
                    : ElevatedButton(
                        onPressed:_toggleEditing,
                        child: const Text('Modifier'),
                      ),
           _isEditing
                ? ElevatedButton(
                    onPressed: _toggleEditing,
                    child: const Text('Enregistrer'),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
