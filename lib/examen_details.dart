// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'examen_passage.dart';
//import 'examen.dart';
import 'examen_resultat.dart';

class ExamenDetails extends StatefulWidget {
  const ExamenDetails({Key? key, required this.examen}) : super(key: key);

  final Examen examen;

  @override
  _ExamenDetailsState createState() => _ExamenDetailsState();
}

class _ExamenDetailsState extends State<ExamenDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          widget.examen.titre,
          style: const TextStyle(fontSize: 24.0, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.examen.titre,
              style: const TextStyle(fontSize: 24, color: Colors.blue),
            ),
            const Divider(height: 2, color: Colors.grey),
            Text(
              widget.examen.description,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('Date: '),
                Text(widget.examen.date.toString()),
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExamenPassage(examen: widget.examen),
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
          ],
        ),
      ),
    );
  }
}

/*class Examen {
  final String titre;
  final String description;
  final DateTime date;
  final int duree;

  Examen({
    required this.titre,
    required this.description,
    required this.date,
    required this.duree,
  });
}*/
