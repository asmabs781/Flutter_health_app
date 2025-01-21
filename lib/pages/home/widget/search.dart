import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 250), // Augmenter l'espace en haut
      child: Container(
        height: 70, // Hauteur de la barre de recherche
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white, // Fond blanc pour la barre
          borderRadius: BorderRadius.circular(30), // Coins arrondis
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 3), // Légère ombre
            ),
          ],
        ),
        child: Row(
          children: [
            // Icône de recherche à gauche
            Icon(
              Icons.search,
              color: const Color.fromARGB(66, 158, 158, 158),
              size: 30,
            ),
            // Champ de texte de recherche
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search in Cardio Care...', // Texte d'exemple
                  border: InputBorder.none, // Pas de bordure
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),
            // Icône de micro à droite
            Icon(
              Icons.mic,
              color: const Color.fromARGB(81, 90, 89, 89),
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
