import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sport App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SportScreen(),
    );
  }
}

class SportScreen extends StatefulWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  _SportScreenState createState() => _SportScreenState();
}

class _SportScreenState extends State<SportScreen> {
  // List of exercises for different categories
  final Map<String, List<Map<String, String>>> exercises = {
    "Heart Patients": [
      {
        "image": "assets/images/walking.png",
        "name": "Walking",
        "description": "A gentle exercise to improve heart health.",
        "duration": "20 minutes",
        "tips": "Start with a slow pace and gradually increase your speed.",
        "repetitions": "3 sessions per week",
        "level": "Easy",
      },
      {
        "image": "assets/images/stretching.jpg",
        "name": "Stretching",
        "description": "Improves flexibility and reduces stress.",
        "duration": "10 minutes",
        "tips": "Perform gentle stretches and breathe deeply.",
        "repetitions": "Daily",
        "level": "Easy",
      },
      {
        "image": "assets/images/on_4.png",
        "name": "Yoga",
        "description": "Reduces stress and improves heart rate.",
        "duration": "15 minutes",
        "tips": "Focus on breathing and posture.",
        "repetitions": "3 sessions per week",
        "level": "Moderate",
      },
    ],
    "Normal People": [
      {
        "image": "assets/images/pushup.jpg",
        "name": "Push-Ups",
        "description": "Strengthens chest, arms, and shoulders.",
        "duration": "15 minutes",
        "tips": "Keep your back straight and lower yourself slowly.",
        "repetitions": "3 sets of 10 reps",
        "level": "Intermediate",
      },
      {
        "image": "assets/images/on_2.png",
        "name": "Running",
        "description": "Improves cardiovascular health and stamina.",
        "duration": "30 minutes",
        "tips": "Maintain a steady pace and stay hydrated.",
        "repetitions": "5 sessions per week",
        "level": "Advanced",
      },
      {
        "image": "assets/images/jump.jpg",
        "name": "Squats",
        "description": "Builds strength in legs and glutes.",
        "duration": "10 minutes",
        "tips": "Keep your knees aligned and back straight.",
        "repetitions": "3 sets of 15 reps",
        "level": "Intermediate",
      },
      {
        "image": "assets/images/plank.jpg",
        "name": "Plank",
        "description": "Improves core strength and stability.",
        "duration": "5 minutes",
        "tips": "Keep your body straight and engage your core.",
        "repetitions": "Daily",
        "level": "Moderate",
      },
    ],
  };

  String selectedCategory = "Heart Patients"; // Selected category

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sport Exercises"),
      ),
      body: Column(
        children: [
          // Dropdown to select a category
          DropdownButton<String>(
            value: selectedCategory,
            items: exercises.keys.map((category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCategory = value!;
              });
            },
          ),
          // List of exercises
          Expanded(
            child: ListView.builder(
              itemCount: exercises[selectedCategory]?.length ?? 0,
              itemBuilder: (context, index) {
                final exercise = exercises[selectedCategory]![index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: Image.asset(
                      exercise["image"]!,
                      width: 100,
                      height: 100,
                    ),
                    title: Text(exercise["name"]!),
                    subtitle: Text(exercise["description"]!),
                    trailing: IconButton(
                      icon: const Icon(Icons.info),
                      onPressed: () {
                        // Show exercise details
                        showDialog(
                          context: context,
                          builder: (context) {
                            return ExerciseDetailsDialog(exercise: exercise);
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Widget to display exercise details and a timer
class ExerciseDetailsDialog extends StatefulWidget {
  final Map<String, String> exercise;

  const ExerciseDetailsDialog({Key? key, required this.exercise})
      : super(key: key);

  @override
  _ExerciseDetailsDialogState createState() => _ExerciseDetailsDialogState();
}

class _ExerciseDetailsDialogState extends State<ExerciseDetailsDialog> {
  late Timer _timer;
  late int _timeLeft;

  @override
  void initState() {
    super.initState();
    // Convert duration to seconds
    _timeLeft =
        int.parse(widget.exercise["duration"]!.split(" ")[0]) * 60; // In minutes
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        _timer.cancel();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Time's up!")),
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minutes = (_timeLeft ~/ 60).toString().padLeft(2, '0');
    final seconds = (_timeLeft % 60).toString().padLeft(2, '0');

    return AlertDialog(
      title: Text(widget.exercise["name"]!),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.exercise["image"]!, height: 100),
            const SizedBox(height: 10),
            Text("Description: ${widget.exercise["description"]}"),
            const SizedBox(height: 10),
            Text("Duration: ${widget.exercise["duration"]}"),
            Text("Tips: ${widget.exercise["tips"]}"),
            Text("Repetitions: ${widget.exercise["repetitions"]}"),
            Text("Level: ${widget.exercise["level"]}"),
            const SizedBox(height: 20),
            // Timer for the exercise
            Center(
              child: Text(
                "$minutes:$seconds",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _timer.cancel();
                setState(() {
                  _timeLeft =
                      int.parse(widget.exercise["duration"]!.split(" ")[0]) *
                          60;
                });
                _startTimer();
              },
              child: const Text("Restart Timer"),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Close"),
        ),
      ],
    );
  }
}
