import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:async';

class AccelerometerScreen extends StatefulWidget {
  @override
  AccelerometerScreenState createState() => AccelerometerScreenState();
}

class AccelerometerScreenState extends State<AccelerometerScreen> {
  double _x = 0.0;
  double _y = 0.0;
  double _circleSize = 50.0;
  StreamSubscription? _accelerometerSubscription;

  @override
  void initState() {
    super.initState();
    _accelerometerSubscription =
        accelerometerEventStream().listen((AccelerometerEvent event) {
          setState(() {
            _x = event.x * 10;
            _y = event.y * 10;

            _circleSize = 50 + (event.z.abs() * 10);
          });
        });
  }

  @override
  void dispose() {
    _accelerometerSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accelerometer'),
      ),
      body: Stack(
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width / 2 + _x - _circleSize / 2,
            top: MediaQuery.of(context).size.height / 2 - _y - _circleSize / 2,
            child: CircleAvatar(
              radius: _circleSize / 2,
              backgroundColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
