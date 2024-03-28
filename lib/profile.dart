// ignore_for_file: prefer_const_constructors, unused_element, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'acceuil.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _currentUser = User(
    id: 1,
    nom: 'Anas Bouroumana',
    email: 'Anas@example.com',
    telephone: '+212 654 321 000',
    filiere: 'GI2',
  );

  void _navigateToEditInfo(String key) {
    // hna lmodification
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon profil'),
        backgroundColor: const Color(0xFF2196F3),
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
            _buildInfoRow('Nom', _currentUser.nom),
            const SizedBox(height: 10),
            _buildInfoRow('Email', _currentUser.email),
            const SizedBox(height: 10),
            _buildInfoRow('Téléphone', _currentUser.telephone),
            const SizedBox(height: 10),
            _buildInfoRow('Filière', _currentUser.filiere),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class User {
  final int id;
  final String nom;
  final String email;
  final String telephone;
  final String filiere;

  User({
    required this.id,
    required this.nom,
    required this.email,
    required this.telephone,
    required this.filiere,
  });
}
