import 'package:flutter/material.dart';
import 'accelerometer_screen.dart'; // Ensure the file exists and contains the correct AccelerometerScreen implementation
import 'gyroscope_screen.dart';
import 'magnetometer_screen.dart';
import 'barometer_screen.dart';
//import 'temperature_screen.dart'; // Import your updated screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sensors demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sensors demo'),
      ),
      body: ListView(
        children: [
          SensorButton(
            title: 'Accelerometer',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccelerometerScreen()),
              );
            },
          ),
          SensorButton(
            title: 'Gyroscope',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GyroscopeScreen()),
              );
            },
          ),

          SensorButton(
            title: 'Magnetometer',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MagnetometerScreen()),
              );
            },
          ),
          SensorButton(
            title: 'Barometer',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BarometerScreen()),
              );
            },
          ),

          //
          // SensorButton(
          // title: 'Temperature',
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => TemperatureScreen()),
          //     );
          //   },
          // ),

        ],
      ),
    );
  }
}

class SensorButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  SensorButton({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
