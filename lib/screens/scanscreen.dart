import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200.w,
          height: 200.h,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blueGrey[50],
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade800.withOpacity(0.3), // Shadow color with opacity
                spreadRadius: 5, // Spread radius
                blurRadius: 10, // Blur radius
                offset: const Offset(0, 3), // Offset in the x, y direction
              ),
            ]
          ),
          child: Center(child: Text(
      'Start Day',
      style: GoogleFonts.lexend(
        textStyle: TextStyle(color: Colors.grey[600], fontSize: 20,fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
      ),
    ),),
        ),
      ),
    );
  }
}