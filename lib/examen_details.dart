// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quiz_app/examen_resultat.dart';
import 'examen_passage.dart';
//import 'examen.dart';
//import 'examen_resultat.dart';
import 'package:quiz_app/model/examen.dart';

class ExamenDetails extends StatefulWidget {
  const ExamenDetails({Key? key, required this.examen}) : super(key: key);

  final Examen examen;

  @override
  _ExamenDetailsState createState() => _ExamenDetailsState();
}

class _ExamenDetailsState extends State<ExamenDetails> {
  @override
  Widget build(BuildContext context) {
    final canTakeExam = isToday(widget.examen.date) && !widget.examen.passed;
    final formattedDate =
        DateFormat('y MMM d, HH:mm').format(widget.examen.date);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 46, 125, 243),
        title: Text(
          widget.examen.titre,
          style: const TextStyle(
              fontSize: 24.0, color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.examen.titre,
              style: const TextStyle(fontSize: 24, color: Colors.black),
            ),
            const Divider(height: 2, color: Colors.grey),
            Text(
              widget.examen.description,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('Prof: '),
                Text(widget.examen.prof),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text('Date: '),
                Text(formattedDate),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text('Durée: '),
                Text('${widget.examen.duree} minutes'),
              ],
            ),
            const SizedBox(height: 20),
            if (canTakeExam) ...[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ExamenPassage(examen: widget.examen),
                    ),
                  );
                },
                child: const Text('Passer l\'examen'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ] else if (widget.examen.passed) ...[
              ElevatedButton(
                onPressed: () {
                  /*Navigator.push(
                    context, // Assuming the result page needs context
                    MaterialPageRoute(
                      builder: (context) => ExamenResultat(examen: widget.examen, duree: null, reponsesChoisies: [],
                      ),
                    ),
                  );*/
                },
                child: const Text('Voir les résultats'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  bool isToday(DateTime date) {
    final today = DateTime.now();
    return date.year == today.year &&
        date.month == today.month &&
        date.day == today.day;
  }
}
