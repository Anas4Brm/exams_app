import 'package:flutter/material.dart';
//import 'package:quiz_app/data/examen_data.dart';
import 'package:quiz_app/model/examen.dart';

//import 'examen_passage.dart';

class ExamenResultat extends StatelessWidget {
  final Examen examen;
  final int duree;
  final List<String> reponsesChoisies;

  const ExamenResultat({
    Key? key,
    required this.examen,
    required this.duree,
    required this.reponsesChoisies,
  }) : super(key: key);

  int _calculateResult(List<String> reponsesChoisies) {
    // calcul Résultat
    int nbCorrectAnswers = 0;
    for (int i = 0; i < examen.questions.length; i++) {
      if (reponsesChoisies[i] == examen.questions[i].reponseCorrecte) {
        nbCorrectAnswers++;
      }
    }
    return nbCorrectAnswers;
  }

  @override
  Widget build(BuildContext context) {
    int result = _calculateResult(reponsesChoisies);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Résultat de l\'examen'),
        backgroundColor: const Color(0xFF2196F3),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Examen : ${examen.titre}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Durée : $duree secondes'),
                Text('Note : $result / ${examen.questions.length}'),
              ],
            ),

            // Liste des questions et réponses
            const Divider(thickness: 1),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: examen.questions.length,
              itemBuilder: (context, index) {
                return _buildQuestionResultItem(
                    examen.questions[index], reponsesChoisies[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionResultItem(Question question, String reponseChoisie) {
    bool isCorrect = question.reponseCorrecte == reponseChoisie;
    return ListTile(
      title: Text(question.question),
      subtitle: Text(reponseChoisie),
    );
  }
}
