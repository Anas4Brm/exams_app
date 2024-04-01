// ignore_for_file: null_closures, prefer_const_constructors, sort_child_properties_last, prefer_final_fields, library_private_types_in_public_api, unnecessary_cast

import 'package:flutter/material.dart';
import 'package:quiz_app/model/examen.dart';
import 'dart:async';
//import 'examen.dart';
import 'examen_resultat.dart';

// Import your other classes (examen_details.dart, examen.dart, examen_resultat.dart)
// or adjust paths based on your project structure

class ExamenPassage extends StatefulWidget {
  const ExamenPassage({Key? key, required this.examen}) : super(key: key);

  final Examen examen;

  @override
  _ExamenPassageState createState() => _ExamenPassageState();
}

class _ExamenPassageState extends State<ExamenPassage> {
  int _currentQuestionIndex = 0;
  final int _nbQuestions = 2;
  List<Question> _listQuestions = [
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
  ];
  // List<Question> _listQuestions = widget.examen.questions; // Access questions

  final _stopwatch = Stopwatch();
  double _progress = 0.0;
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    _stopwatch.start();
    _updateProgress(); // Start updating progress
  }

  @override
  void dispose() {
    _stopwatch.stop();
    super.dispose();
  }

  void _updateProgress() {
    final remainingTime =
        widget.examen.duree * 60 - _stopwatch.elapsed.inSeconds;
    final progress = remainingTime.toDouble() / (widget.examen.duree * 60);
    setState(() {
      _progress = progress.clamp(0.0, 1.0);
    });
    if (progress >= 1.0 && !_isCompleted) {
      _handleExamenCompletion();
      _isCompleted = true;
    } else {
      Future.delayed(const Duration(milliseconds: 50),
          _updateProgress); // Update every 50ms
    }
  }

  void _onReponseSelectionnee(String valeur) {
    setState(() {
      _listQuestions[_currentQuestionIndex].reponseChoisie = valeur;
    });
  }

  void _onQuestionSuivante() {
    if (_currentQuestionIndex < _nbQuestions - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      _handleExamenCompletion();
    }
  }

  void _handleExamenCompletion() {
    _stopwatch.stop();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ExamenResultat(
          examen: widget.examen,
          duree: _stopwatch.elapsed.inMinutes,
          reponsesChoisies:
              _listQuestions.map((q) => q.reponseChoisie as String).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.examen.titre} - Question ${_currentQuestionIndex + 1} / $_nbQuestions',
        ),
        actions: [
          LinearProgressIndicator(
            value: _progress,
            color: Colors.blue,
            backgroundColor: Colors.grey,
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(Icons.stop),
            onPressed: _handleExamenCompletion,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.examen.titre,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFF2196F3),
                  ),
                ),
                Text(
                  "${_stopwatch.elapsed.inMinutes.toString()}m ${_stopwatch.elapsed.inSeconds % 60}s",
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Questions: $_nbQuestions",
                    style: TextStyle(color: Color(0xFF212121)),
                  ),
                  Text(
                    "Durée: ${widget.examen.duree} min",
                    style: TextStyle(color: Color(0xFF212121)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Color(0xFFF8F8F8),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _listQuestions[_currentQuestionIndex].question,
                    style: TextStyle(fontSize: 18.0, color: Color(0xFF212121)),
                  ),
                  const SizedBox(height: 15.0),
                  ..._listQuestions[_currentQuestionIndex]
                      .reponses
                      .map((reponse) => _buildRadioListTile(reponse)),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _currentQuestionIndex > 0
                    ? TextButton(
                        onPressed: () =>
                            setState(() => _currentQuestionIndex--),
                        child: const Text('Précédent'),
                      )
                    : const SizedBox(),
                TextButton(
                  onPressed: _onQuestionSuivante,
                  child: Text('Suivant'),
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF2196F3),
                    foregroundColor: Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            if (!_isCompleted) // Only show button if not completed
              ElevatedButton(
                onPressed: () => _handleExamenCompletion(),
                child: const Text('Valider les réponses'),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioListTile(Reponse reponse) {
    String selectedChoice =
        _listQuestions[_currentQuestionIndex].reponseChoisie;
    Color choiceColor = Color(0xFFEEEEEE);
    if (reponse.valeur == selectedChoice &&
        selectedChoice ==
            _listQuestions[_currentQuestionIndex].reponseCorrecte) {
      choiceColor = Color(0xFFC8E6C9);
    } else if (reponse.valeur == selectedChoice &&
        selectedChoice !=
            _listQuestions[_currentQuestionIndex].reponseCorrecte) {
      choiceColor = Color(0xFFE0B2B2);
    }

    return RadioListTile(
      value: reponse.valeur,
      groupValue: _listQuestions[_currentQuestionIndex].reponseChoisie,
      onChanged: (value) => _onReponseSelectionnee(value as String),
      title: Text(reponse.texte),
      activeColor: choiceColor,
      controlAffinity: ListTileControlAffinity.platform,
    );
  }
}
