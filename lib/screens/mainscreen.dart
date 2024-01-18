import 'package:employee_management/screens/widget/mainscreen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
  
  String formattedDate = DateFormat('EEEE, d MMMM yyyy', 'en_US').format(DateTime.now());
  
  @override
  Widget build(BuildContext context) {
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
      body:  Container(
        
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
                        Icon(Icons.star_rate_rounded,color: Colors.deepPurple,size: 50.sp,),
                        Icon(Icons.person_2_rounded,color: Colors.white,size: 50.sp,),
                        //Text('ABCD',style: TextStyle(color: Colors.white,fontSize: 24.sp),),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.sp),
                          child: Text("Morning, User", style: GoogleFonts.lexend(color: Colors.white,fontSize: 20.sp),),
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
                      height: 500.h,
                      decoration: BoxDecoration(borderRadius: BorderRadius.horizontal(left: Radius.circular(15.w), right: Radius.circular(15.w),),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.deepPurpleAccent, // Set the shadow color
                          offset: Offset(0, 10), // Specify the offset (x, y) to create the shadow effect
                          blurRadius: 25.0, // Specify the blur radius to control the blurriness of the shadow
                          spreadRadius: 5, // Specify the spread radius if needed
                        ),
                      ],
                      color: Colors.grey[100],
        
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
                            ),
                            child: Padding(
                              padding:  EdgeInsets.all(8.w),
                              child: Text("${formattedDate} ",style: GoogleFonts.lexend(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.normal )),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          
                          SizedBox(
                            height: 5.h,
                          ),
                          //Break time
                          Row(
                            children: [
                              timeBoxes("08:10 AM","Actual check in",Icons.check_circle),
                              const Spacer(),
                              timeButtons("Check In","Last 10 minutes",Icons.login_rounded),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          //Break time
                          Row(
                            children: [
                              timeBoxes("08:10 AM","Actual check in",Icons.check_circle),
                              const Spacer(),
                              timeButtons("Check In","Last 10 minutes",Icons.login_rounded),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          //Break time
                          Row(
                            children: [
                              timeBoxes("08:10 AM","Actual check in",Icons.check_circle),
                              const Spacer(),
                              timeButtons("Check In","Last 10 minutes",Icons.login_rounded),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          //Break time
                          Row(
                            children: [
                              timeBoxes("08:10 AM","Actual check in",Icons.check_circle),
                              const Spacer(),
                              timeButtons("Check In","Last 10 minutes",Icons.login_rounded),
                            ],
                          ),
                          Row(
                            children: [
                              overTimeButton(context),
                            ],
                          ),
                          
                        ],
                      )
                    )
                  ],
                ),
              ),
              ),
      ),
    );
  }
}