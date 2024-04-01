// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
//import 'inscription.dart';
import 'package:intl/intl.dart';
//import 'package:quiz_app/model/user.dart';
import 'profile.dart';
import 'examen_details.dart';
import 'package:quiz_app/model/examen.dart';
import 'package:quiz_app/data/examen_data.dart';
//import 'examen_resultat.dart';
//import 'examen.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  // final _searchController = TextEditingController();
  /* final _currentUser = User(
    id: 1,
    nom: 'Anas',
    prenom: 'Bouroumana',
    email: 'Anasbou@example.com',
    filiere: 'GI2',
  );*/
  final _examens = sampleExamens;
  List<Examen> _filteredExams = [];

  final List<Examen> recentsExams = [
    sampleExamens[0], // Assuming first exam is for today
    sampleExamens[1], // Assuming second exam is for today
  ];
  final List<Examen> aujourdHuiExams = [
    sampleExamens[2], // Assuming first exam is for today
    sampleExamens[3], // Assuming second exam is for today
  ];
  final List<Examen> aVenirExams = [
    sampleExamens[4], // Assuming third exam is upcoming
    sampleExamens[5], // Assuming fourth exam is upcoming
  ];
/*
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
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTopInformation(),
            const SizedBox(height: 20),
            /* _buildListeExamens(
                'Récents',
                _filterRecentExams(_examens), // Filter recent finished exams
                context,
                true),
            _buildListeExamens(
                'Aujourd\'hui',
                _filterTodaysExams(_examens), // Filter exams for today
                context,
                false),
            _buildListeExamens(
                'A venir',
                _filterUpcomingExams(_examens), // Filter upcoming exams
                context,
                false),*/

            /*_buildListeExamens('Récents', _examens, context, true),
            _buildListeExamens(
                'Aujourd\'hui',
                _examens.where((e) => e.date == DateTime.now()).toList(),
                context,
                false),
            _buildListeExamens(
                'A venir',
                _examens.where((e) => e.date.isAfter(DateTime.now())).toList(),
                context,
                false),*/
            _buildListeExamens('Récents', recentsExams, context,
                true), // Empty list for Récents

            _buildListeExamens('Aujourd\'hui', aujourdHuiExams, context, false),
            _buildListeExamens('A venir', aVenirExams, context, false),

            // Listes d'examens
          ],
        ),
      ),

      //),
    );
  }

  Widget _buildTopInformation() {
    return Container(
      height: 235,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 46, 125, 243),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () => Navigator.pop(context),
                ),
                const Text(
                  'IPASS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
                const Spacer(),
                Row(
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
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, '/connexion'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 78.0),
            _buildSearchBar(),
          ],
        ),
      ),
    );
  }

  List<Examen> _filterRecentExams(List<Examen> exams) {
    // Logic to filter exams based on user progress (finished and bool var true)
    return exams
        .where((examen) => examen.passed && examen.resultat != null)
        .toList();
  }

  List<Examen> _filterTodaysExams(List<Examen> exams) {
    final today = DateTime.now();
    return exams
        .where((examen) =>
            examen.date.year == today.year &&
            examen.date.month == today.month &&
            examen.date.day == today.day)
        .toList();
  }

  List<Examen> _filterUpcomingExams(List<Examen> exams) {
    final today = DateTime.now();
    return exams.where((examen) => examen.date.isAfter(today)).toList();
  }

  Widget _buildSearchBar() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 236, 236, 236),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        //controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Rechercher un examen',
          filled: true,
          fillColor: const Color.fromARGB(255, 236, 236, 236),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Icon(Icons.search),
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
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            )),
        const SizedBox(height: 10),
        if (examens.isNotEmpty) //
          _buildCartesExamens(examens, context),
        if (examens.where((e) => e.date.isAfter(DateTime.now())).isNotEmpty)
          _buildCartesExamens(
              examens.where((e) => e.date.isAfter(DateTime.now())).toList(),
              context),
      ],
    );
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
