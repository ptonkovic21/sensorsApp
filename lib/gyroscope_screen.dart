import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:async';

class GyroscopeScreen extends StatefulWidget {
  @override
  GyroscopeScreenState createState() => GyroscopeScreenState();
}

class GyroscopeScreenState extends State<GyroscopeScreen> {
  double _x = 0.0;
  double _y = 0.0;
  StreamSubscription? _gyroscopeSubscription;

  @override
  void initState() {
    super.initState();
    _gyroscopeSubscription =
        gyroscopeEventStream().listen((GyroscopeEvent event) {
          setState(() {
            _x += event.y * 10;
            _y += event.x * 10;

            _x = _x.clamp(-150.0, 150.0);
            _y = _y.clamp(-300.0, 300.0);
          });
        });
  }

  @override
  void dispose() {
    _gyroscopeSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gyroscope'),
      ),
      body: Stack(
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width / 2 + _x - 25,
            top: MediaQuery.of(context).size.height / 2 + _y - 25,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
