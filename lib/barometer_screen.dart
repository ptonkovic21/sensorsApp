import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:async';
import 'dart:math';

class BarometerScreen extends StatefulWidget {
  @override
  BarometerScreenState createState() => BarometerScreenState();
}

class BarometerScreenState extends State<BarometerScreen> {
  double _pressure = 1013.25;
  double _altitude = 0.0;
  StreamSubscription? _barometerSubscription;

  @override
  void initState() {
    super.initState();
    _barometerSubscription = barometerEventStream().listen((event) {
      setState(() {
        _pressure = event.pressure;

        _altitude = 44330 * (1.0 - pow(_pressure / 1013.25, 0.1903));
      });
    });
  }

  @override
  void dispose() {
    _barometerSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barometer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pressure: ${_pressure.toStringAsFixed(2)} hPa',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Estimated Altitude: ${_altitude.toStringAsFixed(2)} meters',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
