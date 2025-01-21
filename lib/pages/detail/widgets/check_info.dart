import 'package:flutter/material.dart';

class CheckInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Heart Health Information'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'Heart Health Tips',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Card(
            child: ListTile(
              title: Text('Normal Heart Rate'),
              subtitle: Text(
                  'A normal resting heart rate for adults ranges from 60 to 100 beats per minute (bpm).'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Tips for Maintaining a Healthy Heart'),
              subtitle: Text(
                  '- Exercise regularly\n- Maintain a balanced diet rich in fruits, vegetables, and whole grains\n- Avoid smoking and excessive alcohol consumption\n- Manage stress through relaxation techniques or meditation'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Signs of a Potential Heart Issue'),
              subtitle: Text(
                  '- Unusually high or low heart rate\n- Chest pain or discomfort\n- Shortness of breath\n- Dizziness or fainting'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('What to Do in Case of an Emergency'),
              subtitle: Text(
                  '- Call emergency services immediately if you or someone else is experiencing severe chest pain, shortness of breath, or fainting.\n- Perform CPR if necessary and trained to do so.'),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Personalized Advice',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Card(
            child: ListTile(
              title: Text('If Your Heart Rate is Too High'),
              subtitle: Text(
                  'Consider slowing down your physical activity and consulting a doctor if your heart rate remains elevated for an extended period.'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('If Your Heart Rate is Too Low'),
              subtitle: Text(
                  'Low heart rate (bradycardia) might be normal for well-trained athletes, but consult a doctor if it’s accompanied by fatigue or dizziness.'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Monitor Your Heart Rate Regularly'),
              subtitle: Text(
                  'Use a fitness tracker, smartwatch, or other heart rate monitoring devices to keep track of your heart health.'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Follow Medical Advice'),
              subtitle: Text(
                  'If you have a diagnosed heart condition, follow your doctor’s advice regarding medication, diet, and exercise.'),
            ),
          ),
        ],
      ),
    );
  }
}
