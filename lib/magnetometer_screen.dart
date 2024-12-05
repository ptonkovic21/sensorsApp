import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:async';
import 'dart:math';

class MagnetometerScreen extends StatefulWidget {
  @override
  MagnetometerScreenState createState() => MagnetometerScreenState();
}

class MagnetometerScreenState extends State<MagnetometerScreen> {
  double _angle = 0.0;
  StreamSubscription? _magnetometerSubscription;

  @override
  void initState() {
    super.initState();
    _magnetometerSubscription =
        magnetometerEventStream().listen((MagnetometerEvent event) {
          setState(() {
            _angle = atan2(event.y, event.x) * (180 / pi);
          });
        });
  }

  @override
  void dispose() {
    _magnetometerSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Magnetometer'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Center(child: Text('N', style: TextStyle(fontSize: 24))),
            ),
            Transform.rotate(
              angle: _angle * (pi / 180),
              child: Container(
                width: 10,
                height: 100,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
