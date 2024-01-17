import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _currentTime = '';
  DateTime? startTime;
  DateTime? stopTime;
  String? result;
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
          var result = _calculateTotalTime();
        }
        result = _calculateTotalTime();
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
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100.h,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(20.w),topEnd: Radius.circular(20.w))
              ),
              child:  Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.star,color: Colors.white,size: 30.sp),
                        Icon(Icons.person,color: Colors.white,size: 30.sp)
                      ],
                    ),
                    Text("Morning",style: TextStyle(color: Colors.white,fontSize: 24.sp,fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text("Let's be productive today",style: TextStyle(color: Colors.white,fontSize: 14.sp,fontWeight: FontWeight.normal),)
                  ],
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Text(
              _currentTime,
              style: TextStyle(fontSize: 40, color: Colors.black),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
              onPressed: () {
                _toggleTimer();
              },
              child: Text(startTime == null ? 'Start Timer' : 'Stop Timer'),
                        ),
                
                //Text(result.toString(),style: TextStyle(fontSize: 40, color: Colors.black),),
                   
     Text(result!=null?result.toString():'',style: TextStyle(fontSize: 40, color: Colors.black),)
          
                ],
              ),
            )   
          ],
        ),
      ),
    );
  }
}
