// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SleepAlarmPage extends StatefulWidget {
  @override
  _SleepAlarmPageState createState() => _SleepAlarmPageState();
}

class _SleepAlarmPageState extends State<SleepAlarmPage> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  TimeOfDay _selectedTime = TimeOfDay.now(); // Heure par défaut
  TextEditingController _timeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _timeController.text = _selectedTime.format(context);
  }

  Future<void> _setSleepAlarm() async {
    // Configurez la notification locale pour l'alarme de sommeil.

    var androidDetails = AndroidNotificationDetails(
      'sleep_alarm_channel', 'Sleep Alarms',
      importance: Importance.high,
      priority: Priority.high,
    );
    var generalNotificationDetails = NotificationDetails(
      android: androidDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0, 
      'Time to Sleep!', 
      'It\'s time to wind down and get some rest. Go to bed now!',
      generalNotificationDetails,
      payload: 'sleep_alarm',
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (newTime != null) {
      setState(() {
        _selectedTime = newTime;
        _timeController.text = _selectedTime.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Sleep Alarm'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Set your bedtime alarm:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(
                labelText: 'Set Time for Bed',
                suffixIcon: Icon(Icons.access_time),
              ),
              readOnly: true,
              onTap: () => _selectTime(context),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _setSleepAlarm,
              child: Text('Set Alarm'),
            ),
            SizedBox(height: 20),
            Text(
              'Tips for better sleep:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '1. Keep your room cool, dark, and quiet.\n'
              '2. Avoid screen time 30 minutes before bed.\n'
              '3. Try to go to bed and wake up at the same time every day.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
