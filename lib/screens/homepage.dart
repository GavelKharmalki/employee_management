import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _currentTime = '';
  DateTime? startTime;
  DateTime? stopTime;

  @override
  void initState() {
    super.initState();
    _updateTime();
    // Update time every second
    Timer.periodic(Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  void _updateTime() {
    setState(() {
      _currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
    });
  }
  void _toggleTimer(){
    setState(() {
      if(startTime == null){
        startTime = DateTime.now();
        print('Start Time: ${DateFormat('HH:mm:ss').format(startTime!)}');
      } else {
        stopTime = DateTime.now();
        print('Stop Time: ${DateFormat('HH:mm:ss').format(stopTime!)}');
        
        if (startTime != null) {
          print('Total Time: ${_calculateTotalTime()}');
        }
        // Reset start time
        startTime = null;
      }
    });
  }

  String _calculateTotalTime() {
    if (startTime != null && stopTime != null) {
      Duration duration = stopTime!.difference(startTime!);
      int hours = duration.inHours;
      int minutes = duration.inMinutes.remainder(60);
      int seconds = duration.inSeconds.remainder(60);
      return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
    return 'N/A';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Time App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _currentTime,
              style: TextStyle(fontSize: 40, color: Colors.black),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _toggleTimer();
              },
              child: Text(startTime == null ? 'Start Timer' : 'Stop Timer'),
            ),
            Text('Total Time: ${_calculateTotalTime()}')
          ],
        ),
      ),
    );
  }
}
