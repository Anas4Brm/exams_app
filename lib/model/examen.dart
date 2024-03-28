//import 'examen_passage.dart';
import '../examen_resultat.dart';

class Examen {
  final String titre;
  final String description;
  final DateTime date;
  final int duree;
  double? resultat;
  final List<Question> questions;

  Examen({
    required this.titre,
    required this.description,
    required this.date,
    required this.duree,
    this.resultat,
    required this.questions,
  });
}
