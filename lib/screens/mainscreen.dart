import 'dart:async';

import 'package:dotted_line/dotted_line.dart';
import 'package:employee_management/providers/mainscreenprovider.dart';
import 'package:employee_management/screens/widget/mainscreen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  final String userId;
  final String token;
  const MainScreen({super.key, required this.userId, required this.token});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool checkedIn = false;
  bool startTimeButton = false;
  String _currentTime = '';
  DateTime? startTime;
  DateTime? stopTime;
  String? result;
  bool endButtonEnabled = false;
  bool afterBreak = false;
  bool iconBreakButton = false;
  
  String formattedDate = DateFormat('EEEE, d MMMM yyyy', 'en_US').format(DateTime.now());
  
  @override
  void initState() {
    // TODO: implement initState
    _updateTime();
    Timer.periodic(Duration(seconds: 1), (timer) {
      _updateTime();
    });
    super.initState();
  }

  void _updateTime() {
    setState(() {
      _currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    MainScreenProvider mainScreenProvider = Provider.of<MainScreenProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark
        ),
        excludeHeaderSemantics: true,
      ),
      body:  SingleChildScrollView(
        child: Container(    
          child: Padding(
                      padding:  const EdgeInsets.fromLTRB(10, 1.2 * kToolbarHeight, 10, 20),
                child: Container(    
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.stream_rounded,color: Colors.deepPurple,size: 50.sp,),
                          
                          ClipOval(
      child: Image.network(
        
        "https://t4.ftcdn.net/jpg/00/97/58/97/360_F_97589769_t45CqXyzjz0KXwoBZT9PRaWGHRk5hQqQ.jpg",
        width: 30.w,
        height: 30.h,
        fit: BoxFit.cover, // Adjust the fit as needed
      ),
    ),
                          //Text('ABCD',style: TextStyle(color: Colors.white,fontSize: 24.sp),),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.sp),
                            child: Text("Morning, ${widget.userId}", style: GoogleFonts.lexend(color: Colors.white,fontSize: 20.sp),),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.sp),
                            child: Text("Let's be productive today", style: GoogleFonts.lexend(color: Colors.white,fontSize: 18.sp),),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(10.w),
                        width: MediaQuery.of(context).size.width,
                        //height: 500.h,
                        decoration: BoxDecoration(borderRadius: BorderRadius.horizontal(left: Radius.circular(15.w), right: Radius.circular(15.w),),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.deepPurpleAccent, // Set the shadow color
                            offset: Offset(0, 10), // Specify the offset (x, y) to create the shadow effect
                            blurRadius: 25.0, // Specify the blur radius to control the blurriness of the shadow
                            spreadRadius: 5, // Specify the spread radius if needed
                          ),
                        ],
                        color: Colors.white,
          
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Overview", style: GoogleFonts.lexend(color: Colors.black,fontSize: 24.sp,fontWeight: FontWeight.normal)),    
                                
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.w),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade200,
                                      //color: Colors.black,
                                      blurRadius: 5,
                                      spreadRadius: 0,
                                      offset: Offset(0,1),
                                      )
                                    ]
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.all(10.w),
                                    child: Text("May 2023 ",style: TextStyle(color: Colors.black),),
                                  ),
                                )
                              ],
                            ),
                            
                            Column(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(top: 10.sp,bottom: 10.sp),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.w),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.all(15.w),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Presence ",style: GoogleFonts.lexend(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.w200 )),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text("20",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.sp),)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 2.w,
                                    height: 40.h,
                                    color: Colors.grey,
                                  ),
                                  Container(
                                   decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.w),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.all(15.w),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Absence ",style: GoogleFonts.lexend(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.w200 )),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text("3",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.sp),)
                                        ],
                                      ),
                                    ),
                                  ),
                                Container(
                                    width: 2.w,
                                    height: 40.h,
                                    color: Colors.grey,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.w),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.all(15.w),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Lateness ",style: GoogleFonts.lexend(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.w200 )),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text("1,5 h",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.sp),)
                                        ],
                                      ),
                                    ),
                                  ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.w),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade200,
                                      //color: Colors.black,
                                      blurRadius: 5,
                                      spreadRadius: 0,
                                      offset: Offset(0,0),
                                    )
                                     
                                  ]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.all(8.w),
                                    child: Text("${formattedDate} ",style: GoogleFonts.lexend(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.normal )),
                                  ),
                                 
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Container(
                                //   child: verticalLineWithIcons(),
                                // ),
                               //Text("abc",style: TextStyle(color: Colors.black),),
                               Stack(
                                alignment: Alignment(0,0),
                                children: [
                                  Padding(
                                   padding:  EdgeInsets.all(10.h),
                                   child: DottedLine(
                                    direction: Axis.vertical,
                                    dashColor: Colors.black,
                                    lineLength: 180.h,
                                   ),
                                 ),
                                 Positioned(
                                  //left: 10.0, // Adjust the left position as needed
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 20.h),
                                      Container(color: Colors.white,  child: mainScreenProvider.checkedInButton? Icon(Icons.check_circle, color: Colors.green):Icon(Icons.circle_outlined, color: Colors.grey)),
                                      SizedBox(height: 30.h),
                                      
                                      iconBreakButton?Container(color:Colors.white, child: Icon(Icons.check_circle, color: Colors.green)):Container(color: Colors.white, child:mainScreenProvider.isBreakActive?Icon(Icons.pin_drop_outlined, color: Colors.deepPurple):Icon(Icons.circle_outlined, color: Colors.grey)),
                                      
                                      SizedBox(height: 40.h),
                                      Container(color: Colors.white,child: !iconBreakButton?Icon(Icons.circle_outlined, color: Colors.grey):Icon(Icons.check_circle, color: Colors.green)),
                                      SizedBox(height: 50.h),
                                      Container(color:Colors.white, child: mainScreenProvider.getCheckoutButton?Icon(Icons.check_circle, color: Colors.green):Icon(Icons.circle_outlined, color: Colors.grey)),
                                      Container(color: Colors.white, height: 10,width: 10,)
                                    ],
                                  ),
                                ),
                                 ],
                                ),
                                // Stack(
                                //   children: [
                                //     Padding(
                                //    padding:  EdgeInsets.all(10.h),
                                //    child: DottedLine(
                                //     direction: Axis.vertical,
                                //     dashColor: Colors.black,
                                //     lineLength: 190.h,
                                //    ),
                                //  ),
                                //   ],
                                // ),
                                Column(
                                  children: [
                                    Row(children: [
                                      mainScreenProvider.checkedInButton?
                                      timeBoxes(mainScreenProvider.currentTime, "Checked in", Icons.abc):
                                      timeBoxes(_currentTime, "Not at work", Icons.abc),
                                      
                                      GestureDetector(onTap: (){
                                        
                                        mainScreenProvider.recordTime();
                                        
                                      },  child: timeButtons("Check in", "Late: 10 minutes", Icons.login_outlined)),
                                    ],),
                                    SizedBox(height: 2.5.h,),
                                    Row(children: [
                                      mainScreenProvider.isBreakActive?
                                      timeBoxes(_currentTime,"On Break" , Icons.abc):
                                      timeBoxes(mainScreenProvider.getTotalBreakDuration(), "Not on break", Icons.abc),
                                      GestureDetector(onTap: (){
                                        setState(() {
                                          iconBreakButton = false;
                                        });
                                        mainScreenProvider.startBreak();
                                        
                                      }, child: timeButtons("Break", "On Going..", Icons.local_cafe_rounded)),
                                    ],),
                                    SizedBox(height: 2.5.h,),
                                    Row(children: [
                                      !iconBreakButton?
                                      timeBoxes("", mainScreenProvider.isBreakActive?"On Break":"Not on break", Icons.abc):
                                      timeBoxes(mainScreenProvider.getAfterBreak, "After Break", Icons.abc),
                                      GestureDetector(onTap:(){
                                        mainScreenProvider.endBreak();
                                        mainScreenProvider.getAfterBreakTime();
                                        setState(() {
                                          iconBreakButton = true;
                                        });
                                      }, child: timeButtons2("After Break", "It is now 12 35 pm", Icons.battery_charging_full_sharp,true)),
                                    ],),
                                    SizedBox(height: 2.5.h,),
                                    Row(children: [
                                      mainScreenProvider.getCheckoutButton?
                                      timeBoxes(mainScreenProvider.checkout, "Check out schedule", Icons.abc):
                                      timeBoxes("6:00 PM", "Check out schedule", Icons.abc),
                                      GestureDetector(onTap: (){
                                        mainScreenProvider.getCheckOut();
                                      }, child: timeButtons2("CheckOut", "It is now 12 35 pm", Icons.logout,false)),
                                    ],),
                                  ],
                                ),
                                
                              ],
                            ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: overTimeButton(context),
                                )
                                ],
                              ),
                            ), 
                          ],
                        )
                      )
                    ],
                  ),
                ),
                ),
        ),
      ),
    );
  }
}