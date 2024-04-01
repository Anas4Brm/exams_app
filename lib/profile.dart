// ignore_for_file: prefer_const_uctors, unused_element, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'acceuil.dart';
import 'package:quiz_app/Model/user.dart';
import 'package:quiz_app/data/user_data.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  /*final _currentUser = User(
    id: 2,
    nom: 'Labrazi',
    prenom: 'Yassine',
    email: 'brazi@example.com',
    filiere: 'GI2',
  );*/
  late User _currentUser;
  final _editingControllers = {
    'nom': TextEditingController(text: ''),
    'prenom': TextEditingController(text: ''),
    'email': TextEditingController(text: ''),
    'filiere': TextEditingController(text: ''),
  };
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _fetchLoggedInUser();
    // Fetch the logged-in user's information from your data source
    //_currentUser = UserData.getLoggedInUser() as User;
    //_editingControllers.forEach(
    //  (key, controller) => controller.text = _currentUser.getProperty(key));
  }

  Future<void> _fetchLoggedInUser() async {
    // Await the Future to get the User
    final loggedInUser = await UserData.getLoggedInUser();

    if (loggedInUser != null) {
      setState(() {
        _currentUser = loggedInUser;
      });
      _editingControllers
          .forEach((key, controller) => controller.text = _currentUser.nom);
    } else {
      // Handle the case where no user is logged in
    }
  }

  void _saveChanges() {
    // Update user information in your data source (e.g., local storage, database)
    _currentUser.nom = _editingControllers['nom']!.text;
    _currentUser.prenom = _editingControllers['prenom']!.text;
    _currentUser.email = _editingControllers['email']!.text;
    _currentUser.filiere = _editingControllers['filiere']!.text;
    UserData.updateUser(_currentUser); // Replace with your actual method
    setState(() {
      _isEditing = false;
    });
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
          if (_isEditing)
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: _saveChanges,
            ),
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
            _buildInfoRow('Nom', _editingControllers['nom']!, 'nom'),
            const SizedBox(height: 10),
            _buildInfoRow('Prenom', _editingControllers['prenom']!, 'prenom'),
            const SizedBox(height: 10),
            _buildInfoRow('Email', _editingControllers['email']!, 'email'),
            const SizedBox(height: 10),
            _buildInfoRow(
                'Filière', _editingControllers['filiere']!, 'filiere'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
      String title, TextEditingController controller, String key) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            if (!_isEditing)
              Text(
                controller.text,
                style: const TextStyle(fontSize: 16),
              ),
            if (_isEditing)
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: '',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            const SizedBox(width: 10),
            if (!_isEditing)
              TextButton(
                onPressed: () => setState(() => _isEditing = true),
                child: const Text('Modifier'),
              ),
          ],
        ),
      ],
    );
  }
}
