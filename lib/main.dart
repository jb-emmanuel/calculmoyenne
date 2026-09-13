import 'package:flutter/material.dart';

void main() {
  runApp(const MonApplication());
}

class Etudiant {
  final String nom;
  final double moyenne;

  const Etudiant({
    required this.nom,
    required this.moyenne,
  });
}

double calculateMoyenne(List<Etudiant> etudiants) {
  if (etudiants.isEmpty) return 0.0;

  double total = 0.0;
  for (final etudiant in etudiants) {
    total += etudiant.moyenne;
  }

  return total / etudiants.length;
}

void moyenneAlertDialog(BuildContext context, double average) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Moyenne des étudiants'),
        content: Text(
          'La moyenne des étudiants est : ${average.toStringAsFixed(2)}',
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qualité Mobile S5',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const PageAccueil(),
      routes: <String, WidgetBuilder>{
        '/details': (context) => const DetailPage(),
      },
    );
  }
}

class PageAccueil extends StatelessWidget {
  const PageAccueil({super.key});

  static const List<Etudiant> etudiants = <Etudiant>[
    Etudiant(nom: 'Alice', moyenne: 17.25),
    Etudiant(nom: 'Bob', moyenne: 16.50),
    Etudiant(nom: 'Charlie', moyenne: 11.75),
    Etudiant(nom: 'David', moyenne: 12.75),
    Etudiant(nom: 'Eve', moyenne: 13.50),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des étudiants'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Liste des étudiants et de leurs moyennes :',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: etudiants.length,
                itemBuilder: (context, index) {
                  final etudiant = etudiants[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12.0),
                    child: ListTile(
                      title: Text('Nom: ${etudiant.nom}'),
                      subtitle: Text(
                        'Moyenne : ${etudiant.moyenne.toStringAsFixed(2)}',
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/details',
                          arguments: etudiant,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                final average = calculateMoyenne(etudiants);
                moyenneAlertDialog(context, average);
              },
              child: const Text('Calculer la moyenne de la classe'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final etudiant =
        ModalRoute.of(context)!.settings.arguments as Etudiant;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Détails de l'étudiant"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Nom de l'étudiant : ${etudiant.nom}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),
            Text(
              'Moyenne : ${etudiant.moyenne.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
