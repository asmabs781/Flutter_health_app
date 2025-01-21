import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/widget/popular.dart';

class CategorySection extends StatelessWidget {
  CategorySection({super.key});

  final categories = [
    {
      'icon': Icons.health_and_safety_sharp, // Icône pour "Health Check"
      'color': const Color.fromARGB(255, 116, 113, 222),
      'title': 'Health Check',
    },
    {
      'icon': Icons.calendar_today_rounded, // Icône pour "Daily"
      'color': const Color.fromARGB(255, 116, 113, 222),
      'title': 'Daily',
    },
    {
      'icon': Icons.sports_gymnastics, // Icône pour "Sport"
      'color': const Color.fromARGB(255, 116, 113, 222),
      'title': 'Sport',
    },
    {
      'icon': Icons.medical_information, // Icône pour "Info"
      'color': const Color.fromARGB(255, 116, 113, 222),
      'title': 'Info',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 600, // Ajustez la hauteur pour un affichage optimal
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Titre "Categories"
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(238, 47, 46, 46),
                ),
              ),
            ),
            // Liste horizontale des catégories
            SizedBox(
              height: 140,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: categories.length,
                itemBuilder: (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: categories[index]['color'] as Color,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Icon(
                          categories[index]['icon'] as IconData,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      categories[index]['title'] as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 20),
              ),
            ),
            // Ligne de séparation stylisée
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Container(
                  width: 200,
                  height: 4,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color.fromARGB(255, 130, 181, 231), Color.fromARGB(255, 178, 173, 244)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            // Titre "What do you want to do?"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'What do you want to do?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(238, 47, 46, 46),
                ),
              ),
            ),
            Popular(),
          ],
        
        ),
      ),
    );
  }
}
