//import 'examen_passage.dart';

class Question {
  final String question;

  final String reponseCorrecte;

  final List<Reponse> reponses;
  String reponseChoisie;

  Question({
    required this.question,
    required this.reponses,
    required this.reponseCorrecte,
    this.reponseChoisie = '',
  });
}

class Reponse {
  final String valeur;
  final String texte;

  Reponse({
    required this.valeur,
    required this.texte,
  });
}

class Examen {
  final String titre;
  final String prof;
  final String description;
  final DateTime date;
  final int duree;
  bool passed;
  double? resultat;
  final List<Question> questions;

  Examen({
    required this.titre,
    required this.prof,
    required this.description,
    required this.date,
    required this.duree,
    this.passed = false,
    this.resultat,
    required this.questions,
  });
}
