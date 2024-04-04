// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
//import 'inscription.dart';
import 'package:intl/intl.dart';
import 'package:quiz_app/Model/user.dart';
import 'package:quiz_app/data/user_data.dart';
import 'package:quiz_app/examen_passage.dart';
//import 'package:quiz_app/model/user.dart';
import 'profile.dart';
import 'examen_details.dart';
import 'package:quiz_app/model/examen.dart';
import 'package:quiz_app/data/examen_data.dart';
//import 'examen_resultat.dart';
//import 'examen.dart';

class Accueil extends StatefulWidget {
  final User? loggedInUser;
  const Accueil({Key? key, this.loggedInUser}) : super(key: key);

  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  late User _user;

  final _examens = sampleExamens;
  late final List<Examen> recentsExams;
  late final List<Examen> aujourdHuiExams;
  late final List<Examen> aVenirExams;

  void _fetchUser() async {
    final loggedInUser = await UserData.getLoggedInUser();
    if (loggedInUser != null) {
      setState(() {
        _user = loggedInUser;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    //_fetchUser();
    recentsExams = _filterRecentExams(_examens);
    aujourdHuiExams = _filterTodaysExams(_examens);
    aVenirExams = _filterUpcomingExams(_examens);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTopInformation(user: widget.loggedInUser),
            const SizedBox(height: 20),
            _buildListeExamens('Examen Passés', recentsExams, context,
                false), // Empty list for Récents
            _buildListeExamens('Aujourd\'hui', aujourdHuiExams, context, false),
            _buildListeExamens('A venir', aVenirExams, context, false),
          ],
        ),
      ),
    );
  }

  Widget _buildTopInformation({required User? user}) {
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
                              builder: (context) =>
                                  Profile())),
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
     final today = DateTime.now();
    // Logic to filter exams based on user progress (finished and bool var true)
    return exams.where((examen) => examen.date.isBefore(today)).toList();
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

  Widget _buildListeExamens(String titre, List<Examen> examens,
      BuildContext context, bool showResult) {
        print("examen size = ${examens.length} showResult = $showResult");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titre,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 10),
        if (examens.isNotEmpty)
          _buildCartesExamens(
              examens.where((e) => !showResult || e.passed).toList(),
              context,
              showResult),
      ],
    );
  }

  Widget _buildCartesExamens(
      List<Examen> examens, BuildContext context, bool showResult) {
    if (examens.isEmpty) return Container(); // Handle empty list case

    return Row(
      children: [
        Expanded(
          child: _buildCarteExamen(examens[0], context, showResult),
        ),
        const SizedBox(width: 16),
        if (examens.length > 1)
          Expanded(
            child: _buildCarteExamen(examens[1], context, showResult),
          ),
      ],
    );
  }

  Widget _buildCarteExamen(
      Examen examen, BuildContext context, bool showResult) {
 
    final formattedDate = DateFormat('y MMM d, HH:mm').format(examen.date);
    return Card(
      child: InkWell(
        onTap: () {
             print("else if (${aujourdHuiExams.contains(examen)} && ${!examen.passed})");
          if (showResult) {
            // Navigate to result page for passed exams
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExamenDetails(examen: examen),
              ),
            );
          } else if (aujourdHuiExams.contains(examen) && !examen.passed) {
            // Today's exam and not yet passed, navigate to exam passage
              print("OK");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExamenDetails(examen: examen),
              ),
            );
          } else {
            // Today's passed exam, upcoming exam, or any other case - show details
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExamenDetails(examen: examen),
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(examen.titre,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(formattedDate),
            ],
          ),
        ),
      ),
    );
  }
}
