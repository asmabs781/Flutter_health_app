import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/sections.dart';
import 'package:flutter_application_1/pages/detail/widgets/check_info.dart';
import 'package:flutter_application_1/pages/detail/widgets/daily.dart';
import 'package:flutter_application_1/pages/detail/widgets/heart_rate.dart';
import 'package:flutter_application_1/pages/detail/widgets/sport.dart';

class Detail extends StatelessWidget {
  final Liste section;

  Detail({super.key, required this.section});

  // Fonction de navigation dynamique en fonction du type de la section
  void _navigateToSection(BuildContext context) {
    if (section.name == 'Sport') {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const SportScreen(),
    ),
  );
    } else if (section.name == 'Heart Rate Monitor') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HeartRateSection()),
      );
    } else if (section.name == 'Daily') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SleepAndMealPlanner()),
      );
    } else if (section.name == 'Heart Health Check') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CheckInfoSection()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(section.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image de fond
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                section.bgImage,
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 16),
            // Nom de la section et type
            Text(
              section.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              section.type,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            // Description
            Text(
              section.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            // Bouton pour ouvrir la page spécifique à la section
            ElevatedButton(
              onPressed: () => _navigateToSection(context), // Appel de la fonction de navigation
              child: const Text('View More'),
            ),
          ],
        ),
      ),
    );
  }
}
