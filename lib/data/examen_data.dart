//import 'package:flutter/material.dart';
import 'package:quiz_app/model/examen.dart';

// Sample exam data
List<Examen> sampleExamens = [
  Examen(
    titre: 'Analyse',
    prof: 'Pr.OUARTASSI',
    date: DateTime(2024, 3, 30),
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
      // Add more questions here
    ],
  ),

  // Add more sample exams here
  Examen(
    titre: 'Laravel',
    prof: 'Pr.TOUFIK',
    //date: DateTime.now().add(Duration(days: 7)),
    date: DateTime(2024, 3, 30),
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
      Question(
        question: 'C\'est quoi Laravel ?',
        reponses: [
          Reponse(valeur: 'a', texte: 'un SGBD'),
          Reponse(valeur: 'b', texte: 'un framework'),
          Reponse(valeur: 'c', texte: 'un Orm'),
          Reponse(valeur: 'd', texte: 'Language de programmation'),
        ],
        reponseCorrecte: 'b',
      ),
    ],
  ),
  Examen(
    titre: 'PL/SQL',
    prof: 'Pr.LAFDAOUI',
    date: DateTime(2024, 4, 1, 13, 30),
    description: 'manipulation de bd',
    duree: 60,
    questions: [
      Question(
        question: '1. PL/SQL est un _________________',
        reponses: [
          Reponse(valeur: 'a', texte: 'Langage structuré en modules'),
          Reponse(valeur: 'b', texte: 'Langage structuré en blocs'),
          Reponse(valeur: 'c', texte: 'Langage structuré en parties'),
          Reponse(valeur: 'd', texte: 'Aucun de ces réponses'),
        ],
        reponseCorrecte: 'b',
      ),
      Question(
        question: '2. Que signifie l’acronyme PL/SQL ?',
        reponses: [
          Reponse(valeur: 'a', texte: 'Private Language/SQL'),
          Reponse(valeur: 'b', texte: 'Pattern Language/SQL'),
          Reponse(valeur: 'c', texte: 'Procedural Language/SQL'),
          Reponse(valeur: 'd', texte: 'Primary Language/SQL'),
        ],
        reponseCorrecte: 'c',
      ),
      Question(
        question: '3. Les variables PL/SQL sont par défaut _______________',
        reponses: [
          Reponse(valeur: 'a', texte: 'Sensibles à la casse'),
          Reponse(valeur: 'b', texte: 'Sensibles aux majuscules'),
          Reponse(valeur: 'c', texte: 'Sensibles aux miniscules'),
          Reponse(valeur: 'd', texte: 'Non sensibles à la casse'),
        ],
        reponseCorrecte: 'd',
      ),
      Question(
        question:
            '4. Une valeur est attribuée à une constante en PL/SQL au moment de l’initialisation.',
        reponses: [
          Reponse(valeur: 'a', texte: 'Initialisation'),
          Reponse(valeur: 'b', texte: 'Déclaration'),
          Reponse(valeur: 'c', texte: 'Valorisation'),
          Reponse(valeur: 'd', texte: 'Numérisation'),
        ],
        reponseCorrecte: 'b',
      ),
    ],
  ),
  Examen(
    titre: 'JAVA EE',
    prof: 'Pr.TOUFIK',
    //date: DateTime.now().add(Duration(days: 7)),
    date: DateTime(2024, 4, 1, 15, 30),
    description: 'Developpement web',
    duree: 60,
    questions: [
      Question(
        question:
            '1. L’objet « ServletContext » est accessible depuis lequel des objets suivants?',
        reponses: [
          Reponse(valeur: 'a', texte: 'HttpServlet'),
          Reponse(valeur: 'b', texte: 'HttpSession'),
          Reponse(valeur: 'c', texte: 'ServletConfig'),
          Reponse(valeur: 'd', texte: 'Tout ces réponses'),
        ],
        reponseCorrecte: 'd',
      ),
      Question(
        question:
            '2. Lequel des éléments suivants n’est pas inclus dans une URL?',
        reponses: [
          Reponse(valeur: 'a', texte: 'l\'adresse IP du client'),
          Reponse(valeur: 'b', texte: 'Protocole'),
          Reponse(valeur: 'c', texte: 'Nom du serveur'),
          Reponse(valeur: 'd', texte: 'La requête'),
        ],
        reponseCorrecte: 'a',
      ),
    ],
  ),
  Examen(
    titre: 'Projet startUp',
    prof: 'Pr.BOUSDIG',
    //date: DateTime.now().add(Duration(days: 7)),
    date: DateTime(2024, 4, 17, 14, 00),
    description: 'Projet startUp',
    duree: 60,
    questions: [],
  ),
  Examen(
    titre: 'Language C',
    prof: 'Pr.KARRA',
    //date: DateTime.now().add(Duration(days: 7)),
    date: DateTime(2024, 4, 18, 15, 30),
    description: 'Structure de données ',
    duree: 60,
    questions: [],
  ),
];
