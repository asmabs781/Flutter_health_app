import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(SleepTrackerApp());
}

class SleepTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sleep Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SleepTrackerScreen(),
    );
  }
}

class SleepTrackerScreen extends StatefulWidget {
  @override
  _SleepTrackerScreenState createState() => _SleepTrackerScreenState();
}

class _SleepTrackerScreenState extends State<SleepTrackerScreen> {
  final List<Map<String, String>> sleepSchedule = [
    {"name": "Bedtime", "time": "10:00 PM", "note": "Ideal bedtime"},
    {"name": "Wake-up", "time": "06:30 AM", "note": "Recommended wake-up time"},
  ];

  final List<FlSpot> sleepData = [
    FlSpot(1, 6.5),
    FlSpot(2, 7.0),
    FlSpot(3, 6.8),
    FlSpot(4, 7.2),
    FlSpot(5, 6.9),
    FlSpot(6, 7.5),
    FlSpot(7, 7.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sleep Tracker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Graph Section
            Text(
              'Weekly Sleep Duration (hours)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            AspectRatio(
              aspectRatio: 1.5,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 28,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    value.toInt().toString(),
                                    style: TextStyle(fontSize: 12),
                                  );
                                },
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 28,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    'Day ${value.toInt()}',
                                    style: TextStyle(fontSize: 12),
                                  );
                                },
                              ),
                            ),
                         ),
                  minY: 5,
                  maxY: 8,
                  lineBarsData: [
                    LineChartBarData(
                      spots: sleepData,
                      isCurved: true,
                      barWidth: 4,
                      color:const Color.fromARGB(255, 145, 255, 229),
                      belowBarData: BarAreaData(show: true, color:const Color.fromARGB(255, 145, 255, 229),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Sleep Schedule Section
            Text(
              'Daily Sleep Schedule',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: sleepSchedule.length,
                itemBuilder: (context, index) {
                  final schedule = sleepSchedule[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(
                        schedule["name"] == "Bedtime"
                            ? Icons.bedtime
                            : Icons.alarm,
                        color: Colors.blueAccent,
                      ),
                      title: Text(schedule["name"]!),
                      subtitle: Text(schedule["note"]!),
                      trailing: Text(
                        schedule["time"]!,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Button Section
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Sleep data logged successfully!"),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  backgroundColor: Colors.blueAccent,
                ),
                child: Text(
                  'Log Sleep Data',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
