import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/detail/widgets/sleeoalarm.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SleepAndMealPlanner extends StatelessWidget {
  // Vous pouvez utiliser le package flutter_local_notifications pour gérer les notifications locales.
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sleep & Meal Planner'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Sleep Section
          Text(
            'Sleep Planner',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          
          // Tracker de sommeil
          Card(
            elevation: 5,
            child: ListTile(
              leading: Image.asset('assets/images/sleep_schedule.png'),
              title: Text('Track Your Sleep'),
              subtitle: Text(
                'A good night\'s sleep is crucial for your overall well-being. Aim for 7-9 hours of uninterrupted sleep. '
                'Use a sleep tracker or smart device to monitor your sleep stages (light, deep, REM) and duration. '
                'Analyzing this data helps in understanding your sleep quality and making improvements.',
              ),
              trailing: IconButton(
                icon: Icon(Icons.trending_up),
                onPressed: () {
                  // Vous pouvez ouvrir un graphique ou une page de suivi du sommeil ici
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SleepTrackerPage()),
                  );
                },
              ),
            ),
          ),
          
          // Alarme de sommeil
          Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.alarm),
              title: Text('Set Sleep Alarms'),
              subtitle: Text(
                'Set bedtime alarms or reminders to ensure consistency in your sleep schedule. '
                'Going to bed and waking up at the same time every day stabilizes your circadian rhythm.',
              ),
              trailing: IconButton(
                icon: Icon(Icons.timer),
                onPressed: () {
                  // Ouvrir une page pour configurer l'alarme
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SleepAlarmPage()),
                  );
                },
              ),
            ),
          ),

          // Améliorer l'hygiène du sommeil
          Card(
            elevation: 5,
            child: ListTile(
              leading: Image.asset('assets/images/alaarm.png'),
              title: Text('Improve Sleep Hygiene'),
              subtitle: Text(
                'Create a relaxing environment for sleep: keep your bedroom cool, quiet, and dark. '
                'Avoid screens (phone, laptop, TV) at least 30 minutes before sleep.',
              ),
            ),
          ),

          SizedBox(height: 20),

          // Meal Planner Section
          Text(
            'Meal Planner',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),

          // Tracker de repas
          Card(
            elevation: 5,
            child: ListTile(
              leading: Image.asset('assets/images/561611.png'),
              title: Text('Track Your Meals'),
              subtitle: Text(
                'Maintaining a balanced diet is essential for overall health. Track your meals using a food journal or app. '
                'Log details such as portion size, ingredients, and meal times to identify healthy eating patterns.',
              ),
              trailing: IconButton(
                icon: Icon(Icons.restaurant_menu),
                onPressed: () {
                  // Ouvrir une page de suivi des repas
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MealTrackerPage()),
                  );
                },
              ),
            ),
          ),

          // Calcul des calories
          Card(
            elevation: 5,
            child: ListTile(
              leading: Image.asset('assets/images/carbo.png'),
              title: Text('Calculate Calories'),
              subtitle: Text(
                'Use a food tracking app or website to log your meals and calculate the total calorie intake. '
                'Ensure your daily calorie intake aligns with your goals.',
              ),
            ),
          ),

          // Suivi des macronutriments
          Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.local_dining),
              title: Text('Check Macronutrients'),
              subtitle: Text(
                'Ensure each meal has a balance of protein, carbs, and fats. Check your macros for muscle gain or weight loss.',
              ),
              trailing: IconButton(
                icon: Icon(Icons.trending_up),
                onPressed: () {
                  // Accéder à un graphique ou une page détaillant les macronutriments
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MacronutrientPage()),
                  );
                },
              ),
            ),
          ),

          SizedBox(height: 20),

          // Medication Reminder Section
          Text(
            'Medication Reminder',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),

          // Rappel de prise de médicament
          Card(
            elevation: 5,
            child: ListTile(
              leading: Image.asset('assets/images/progress_each_photo.png'),
              title: Text('Set Medication Reminders'),
              subtitle: Text(
                'Use an alarm or a dedicated app to set reminders for taking your medication on time.',
              ),
              trailing: IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  // Ouvrir une page pour configurer les rappels de médicaments
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MedicationReminderPage()),
                  );
                },
              ),
            ),
          ),

          // Suivi des dosages de médicaments
          Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.medication),
              title: Text('Track Medication Dosages'),
              subtitle: Text(
                'Log your medication dosages and times to ensure accurate administration.',
              ),
            ),
          ),

          // Suivi des effets secondaires
          Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.report_problem),
              title: Text('Monitor Side Effects'),
              subtitle: Text(
                'If you experience any side effects from medications, keep track of them and report them to your doctor.',
              ),
            ),
          ),

          // Suivi des renouvellements de prescriptions
          Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.healing),
              title: Text('Keep Track of Prescription Renewals'),
              subtitle: Text(
                'Track when you need to renew your prescriptions. Many pharmacies offer automatic prescription refills.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Placeholder pages for each section (you can replace these with actual pages for better UI)

class SleepTrackerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sleep Tracker")),
      body: Center(child: Text("Here you can track your sleep data with graphs and insights.")),
    );
  }
}

class MealTrackerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meal Tracker")),
      body: Center(child: Text("Here you can log and track your meals with nutritional breakdown.")),
    );
  }
}

class MacronutrientPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Macronutrient Tracker")),
      body: Center(child: Text("Track your macronutrient intake (protein, carbs, fats).")),
    );
  }
}

class MedicationReminderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Medication Reminder")),
      body: Center(child: Text("Set reminders for your medication and monitor dosages.")),
    );
  }
}
