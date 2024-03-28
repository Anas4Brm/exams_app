// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
//import 'inscription.dart';
import 'package:intl/intl.dart';
import 'profile.dart';
import 'examen_details.dart';
import 'examen_resultat.dart';
//import 'examen.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  final _searchController = TextEditingController();
  final _currentUser = User(
    id: 1,
    nom: 'Anas Bouremana',
    email: 'Anasbou@example.com',
  );
  List<Examen> _examens = [
    Examen(
      titre: 'Analyse',
      date: DateTime.now().add(Duration(days: 2)),
      description: 'Les séries numériques',
      duree: 60,
      questions: [
        Question(
          question: 'What is 2 + 2?',
          reponses: [
            Reponse(valeur: 'a', texte: '1'),
            Reponse(valeur: 'b', texte: '4'),
            Reponse(valeur: 'c', texte: '3'),
            Reponse(valeur: 'd', texte: '6'),
          ],
          reponseCorrecte: 'b',
        ),
        Question(
          question: 'What is the area of a square with side length 5?',
          reponses: [
            Reponse(valeur: 'a', texte: '10'),
            Reponse(valeur: 'b', texte: '20'),
            Reponse(valeur: 'c', texte: '15'),
            Reponse(valeur: 'd', texte: '35'),
          ],
          reponseCorrecte: 'b',
        ),
      ],
    ),
    Examen(
      titre: 'PL/SQL',
      date: DateTime.now().subtract(Duration(days: 1)),
      description: 'manipulation de bd',
      duree: 60,
      questions: [],
    ),
    Examen(
      titre: 'JAVA EE',
      //date: DateTime.now().add(Duration(days: 7)),
      date: DateTime(2024, 3, 29, 15, 30),
      description: 'Developpement web',
      duree: 60,
      questions: [],
    ),
    Examen(
      titre: 'Laravel',
      //date: DateTime.now().add(Duration(days: 7)),
      date: DateTime(2024, 3, 26),
      description: 'Developpement web',
      duree: 60,
      questions: [
        Question(
          question: 'C\'est quoi Eloquent ?',
          reponses: [
            Reponse(valeur: 'a', texte: 'un SGBD'),
            Reponse(valeur: 'b', texte: 'system d\'exploitation'),
            Reponse(valeur: 'c', texte: 'un Orm'),
            Reponse(valeur: 'd', texte: 'Language de programmation'),
          ],
          reponseCorrecte: 'c',
        ),
      ],
    ),
  ];
  List<Examen> _filteredExams = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      _filterAndDisplayExams(_searchController.text);
    });
  }

  void _filterAndDisplayExams(String searchText) {
    final filteredExams = _examens.where((examen) {
      final lowerCaseTitle = examen.titre.toLowerCase();
      final formattedDate = DateFormat('y MMM d').format(examen.date);
      final lowerCaseSearchText = searchText.toLowerCase();

      return lowerCaseTitle.contains(lowerCaseSearchText) ||
          formattedDate.contains(lowerCaseSearchText);
    }).toList();
    setState(() {
      _filteredExams = filteredExams;
    });

    // Rebuild the UI with filtered exams (explained later)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 46, 125, 243),
      ),
      /*appBar: AppBar(
        title: const Text('IPASS'),
        backgroundColor: Color.fromARGB(255, 87, 147, 224),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Profile())),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, '/connexion'),
          ),
        ],
      ),*/
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 220,
              padding: EdgeInsets.only(left: 20.0, top: 50.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 46, 125, 243),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 40.0,
                    left: 20.0,
                    child: const Text(
                      'IPASS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20.0,
                    top: 40.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.person, color: Colors.white),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Profile()),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.logout, color: Colors.white),
                          onPressed: () => Navigator.pushReplacementNamed(
                              context, '/connexion'),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 20.0,
                    left: 20.0,
                    right: 20.0,
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        labelText: 'Rechercher un examen',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            /* _buildListeExamens(
                'Récents', _filteredExams, context, true), // Use filtered list
            _buildListeExamens(
                'Aujourd\'hui',
                _filteredExams.where((e) => e.date == DateTime.now()).toList(),
                context,
                false),
            _buildListeExamens(
                'A venir',
                _filteredExams
                    .where((e) => e.date.isAfter(DateTime.now()))
                    .toList(),
                context,
                false),*/
            // Listes d'examens
            _buildListeExamens('Récents', _examens, context, true),
            _buildListeExamens(
                'Aujourd\'hui',
                _examens.where((e) => e.date == DateTime.now()).toList(),
                context,
                false),
            _buildListeExamens(
                'A venir',
                _examens.where((e) => e.date.isAfter(DateTime.now())).toList(),
                context,
                false),
          ],
        ),
      ),
    );
  }

  Widget _buildListeExamens(
      String titre, List<Examen> examens, BuildContext context, bool isRecent) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titre,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        /* Visibility(
          visible: examens.length > 2,
          child: TextButton(
            onPressed: () {
              // la liste complète des examens
            },
            child: Text('Voir plus'),
          ),
        ),*/
        const SizedBox(height: 10),
        if (examens.isNotEmpty) //
          _buildCartesExamens(examens, context),
        if (examens.where((e) => e.date.isAfter(DateTime.now())).isNotEmpty)
          _buildCartesExamens(
              examens.where((e) => e.date.isAfter(DateTime.now())).toList(),
              context),
      ],
    );

    /*Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titre,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        if (examens.isNotEmpty) // Check for non-empty list (for "Aujourd'hui")
          _buildCartesExamens(examens, context),
        if (examens.where((e) => e.date.isAfter(DateTime.now())).isNotEmpty)
          _buildCartesExamens(
              examens.where((e) => e.date.isAfter(DateTime.now())).toList(),
              context),
      ],
    );*/
  }
}

Widget _buildCartesExamens(List<Examen> examens, BuildContext context) {
  return Row(
    children: [
      Expanded(
        child: _buildCarteExamen(examens[0], context),
      ),
      const SizedBox(width: 16),
      Expanded(
        child: _buildCarteExamen(examens[1], context),
      ),
      /*Visibility(
        visible: examens.length > 2,
        child: TextButton(
          onPressed: () {

          },
          child: Text('Voir plus'),
        ),
      ),*/
    ],
  );
}

Widget _buildCarteExamen(Examen examen, BuildContext context) {
  final formattedDate = DateFormat('y MMM d, HH:mm').format(examen.date);
  return Card(
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExamenDetails(examen: examen),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(examen.titre,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(formattedDate),
          ],
        ),
      ),
    ),
  );
}

/*class Examen {
  final String titre;
  final DateTime date;
  // ... (autres informations sur l'examen)

  Examen({
    required this.titre,
    required this.date,
  });
}*/

class User {
  final int id;
  final String nom;
  final String email;

  User({
    required this.id,
    required this.nom,
    required this.email,
  });
}
