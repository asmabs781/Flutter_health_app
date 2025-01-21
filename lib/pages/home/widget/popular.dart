import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/sections.dart';
import 'package:flutter_application_1/pages/detail/detail.dart';

class Popular extends StatelessWidget {
  Popular({super.key});

  final List<Liste> section = Liste.section();  // Récupère les sections

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: section.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            // Navigation vers la page Detail avec le passage de l'objet section
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Detail(section: section[index]),
            ));
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image de la section
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                shadowColor: const Color.fromARGB(255, 44, 41, 41).withOpacity(0.2),
                margin: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    section[index].bgImage,
                    fit: BoxFit.cover,
                    height: 250,  // Garder les images grandes
                    width: 200,
                  ),
                ),
              ),
              // Nom de la section
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  section[index].name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }
}
