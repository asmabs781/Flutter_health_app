import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

void main() {
  runApp(HeartRateApp());
}

class HeartRateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HeartRateSection(),
    );
  }
}

class HeartRateSection extends StatefulWidget {
  @override
  _HeartRateSectionState createState() => _HeartRateSectionState();
}

class _HeartRateSectionState extends State<HeartRateSection> {
  final String broker = '192.168.29.202'; // Adresse IP du Raspberry Pi ou du broker MQTT
  final String topic = 'heart_rate/data'; 
  late MqttServerClient client;
  String heartRate = "Waiting for data..."; // Valeur initiale du cœur rate

  @override
  void initState() {
    super.initState();
    connectToMqtt();
  }

  // Fonction pour se connecter au broker MQTT
  Future<void> connectToMqtt() async {
    client = MqttServerClient(broker, 'FlutterClient'); // Nom du client MQTT
    client.port = 1883; // Port MQTT
    client.keepAlivePeriod = 20; // Période de maintien de la connexion
    client.onDisconnected = onDisconnected;
    client.logging(on: false); // Désactiver la journalisation

    try {
      await client.connect();
    } catch (e) {
      print('Connection failed: $e');
      client.disconnect();
    }

    // Vérifier la connexion
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print('Connected to MQTT broker');
      client.subscribe(topic, MqttQos.atMostOnce); // S'abonner au sujet
      // Écouter les messages reçus
      client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
        final MqttPublishMessage message = c[0].payload as MqttPublishMessage;
        final String payload =
            MqttPublishPayload.bytesToStringAsString(message.payload.message);
        setState(() {
          heartRate = payload; // Mettre à jour la fréquence cardiaque reçue
        });
      });
    } else {
      print('Connection failed, status is ${client.connectionStatus}');
      client.disconnect();
    }
  }

  // Fonction pour gérer la déconnexion du broker MQTT
  void onDisconnected() {
    print('Disconnected from MQTT broker');
  }

  @override
  void dispose() {
    client.disconnect(); // Déconnecter lors de la fermeture
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Heart Rate Monitor'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Real-time Heart Rate',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Afficher la fréquence cardiaque reçue en temps réel
            Text(
              heartRate,
              style: TextStyle(fontSize: 48, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
