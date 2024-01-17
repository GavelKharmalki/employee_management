import 'package:employee_management/authentication/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
          child: Text("HomePage",style: TextStyle(color: Colors.black),),
        ),
        SizedBox(
          height: 10.h,
        ),
        GestureDetector(
          onTap: (){
            Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SignUpScreen()),
        );
          },
          child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
          'BACK',
          style: TextStyle(
          color: Colors.white,
              ),
            ),
          ),
        ),
        ],
        
      ),
    );
  }
}