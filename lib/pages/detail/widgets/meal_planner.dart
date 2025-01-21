import 'package:flutter/material.dart';
import 'package:calendar_agenda/calendar_agenda.dart';

class MealPlanner extends StatefulWidget {
  const MealPlanner({Key? key}) : super(key: key);

  @override
  State<MealPlanner> createState() => _MealPlannerState();
}

class _MealPlannerState extends State<MealPlanner> {
  final CalendarAgendaController _calendarAgendaController = CalendarAgendaController();

  final List<Map<String, String>> meals = [
    {"name": "Honey Pancake", "time": "07:00am", "image": "assets/img/honey_pan.png", "type": "breakfast"},
    {"name": "Coffee", "time": "07:30am", "image": "assets/img/coffee.png", "type": "breakfast"},
    {"name": "Chicken Steak", "time": "01:00pm", "image": "assets/img/chicken.png", "type": "lunch"},
    {"name": "Milk", "time": "01:20pm", "image": "assets/img/glass-of-milk.png", "type": "lunch"},
    {"name": "Orange", "time": "04:30pm", "image": "assets/img/orange.png", "type": "snack"},
    {"name": "Apple Pie", "time": "04:40pm", "image": "assets/img/apple_pie.png", "type": "snack"},
    {"name": "Salad", "time": "07:10pm", "image": "assets/img/salad.png", "type": "dinner"},
    {"name": "Oatmeal", "time": "08:10pm", "image": "assets/img/oatmeal.png", "type": "dinner"}
  ];

  final List<Map<String, String>> nutritionStats = [
    {"title": "Calories", "value": "350", "max_value": "500"},
    {"title": "Proteins", "value": "300", "max_value": "1000"},
    {"title": "Fats", "value": "140", "max_value": "1000"},
    {"title": "Carbohydrates", "value": "140", "max_value": "1000"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Meal Planner",
          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Calendrier avec sélection de la date
          CalendarAgenda(
            controller: _calendarAgendaController,
            appbar: false,
            selectedDayPosition: SelectedDayPosition.center,
            weekDay: WeekDay.short,
            backgroundColor: Colors.transparent,
            fullCalendarScroll: FullCalendarScroll.horizontal,
            selectedDateColor: Colors.white,
            dateColor: Colors.black,
            locale: 'en',
            initialDate: DateTime.now(),
            calendarEventColor: Colors.blue,
            firstDate: DateTime.now().subtract(Duration(days: 140)),
            lastDate: DateTime.now().add(Duration(days: 60)),
            onDateSelected: (date) {
              setState(() {
              });
            },
          ),

          // Liste des repas et des informations nutritionnelles
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildMealSections(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildMealSections() {
    final mealTypes = ["breakfast", "lunch", "snack", "dinner"];
    final mealTypeNames = ["Breakfast", "Lunch", "Snacks", "Dinner"];
    List<Widget> sections = [];

    for (int i = 0; i < mealTypes.length; i++) {
      final filteredMeals = meals.where((meal) => meal["type"] == mealTypes[i]).toList();
      sections.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    mealTypeNames[i],
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "${filteredMeals.length} Items",
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredMeals.length,
                itemBuilder: (context, index) {
                  var meal = filteredMeals[index];
                  return ListTile(
                    leading: Image.asset(meal["image"]!),
                    title: Text(meal["name"]!),
                    subtitle: Text(meal["time"]!),
                  );
                },
              ),
            ],
          ),
        ),
      );
    }

    sections.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Today's Nutrition",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ...nutritionStats.map((nutrition) => ListTile(
                  title: Text(nutrition["title"]!),

                )),
          ],
        ),
      ),
    );

    return sections;
  }
}

