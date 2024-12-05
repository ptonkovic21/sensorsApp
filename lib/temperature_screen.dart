import 'package:environment_sensors/environment_sensors.dart';
import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  @override
  TemperatureScreenState createState() => TemperatureScreenState();
}

class TemperatureScreenState extends State<TemperatureScreen> {
  bool _tempAvailable = false;
  final environmentSensors = EnvironmentSensors();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    bool tempAvailable = await environmentSensors
        .getSensorAvailable(SensorType.AmbientTemperature);

    setState(() {
      _tempAvailable = tempAvailable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Sensor'),
      ),
      body: Center(
        child: (_tempAvailable)
            ? StreamBuilder<double>(
          stream: environmentSensors.temperature,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            return Text(
              'Temperature: ${snapshot.data?.toStringAsFixed(2)} °C',
              style: TextStyle(fontSize: 24),
            );
          },
        )
            : Text(
          'No temperature sensor found',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
