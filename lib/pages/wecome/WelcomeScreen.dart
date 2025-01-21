import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login/SignUpScreen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent, // Vous pouvez ajuster la couleur de fond
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/welcome_image.png'), // Ajoutez une image de bienvenue (si vous en avez une)
            SizedBox(height: 20),
            Text(
              'Bienvenue dans l\'application!',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lorsque le bouton est pressé, naviguer vers l'écran d'inscription
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HealthSignUpScreen()), // Remplacez SignUpScreen par le nom de votre écran d'inscription
                );
              },
              child: Text('Commencer'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blueAccent, backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
