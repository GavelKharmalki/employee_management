import 'package:employee_management/screens/widget/profile_widgets/customshape.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.h),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Profile",style: GoogleFonts.lexend(color: Colors.black, fontSize: 20.sp),),
          centerTitle: true,
          leading: const Icon(Icons.arrow_back_ios),
          actions: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                // Add your action when the icon is pressed
              },
            ),
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(10.w),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          //color: Colors.black,
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.w), bottomRight: Radius.circular(20.w))),
          child: Column(
            children: [
              Container(
                height: 100.h,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.blue.shade50, // Specify the color of the border
                              width: 2.0, // Specify the width of the border
                            ),
                          ),
                          child: ClipOval(
                            child: Padding(
                              padding:  EdgeInsets.all(2.w),
                              child: Image.network(
                                "https://t4.ftcdn.net/jpg/00/97/58/97/360_F_97589769_t45CqXyzjz0KXwoBZT9PRaWGHRk5hQqQ.jpg",
                                width: 100.w,
                                height: 100.h,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
        
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text("Zimmy Baskoswasi",style: GoogleFonts.lexend(color: Colors.black,fontSize: 12.sp),),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text("Designing",style: GoogleFonts.lexend(color: Colors.black,fontSize: 10.sp),),
                            Text("Sr UI Designer",style: GoogleFonts.lexend(color: Colors.black,fontSize: 10.sp),),
                            Text("Joined date: Jan 14th 2020",style: GoogleFonts.lexend(color: Colors.black,fontSize: 10.sp),),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(children: [
                              const Icon(Icons.mail_outline),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text("Zimmy@ekbana.info",style: GoogleFonts.lexend(color: Colors.black,fontSize: 10.sp),),
                            ],),
                            Row(children: [
                              const Icon(Icons.mobile_screen_share_outlined),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text("+91 1234567890",style: GoogleFonts.lexend(color: Colors.black,fontSize: 10.sp),),
                            ],)
                          ]),
                        ),
                        SizedBox(
                          width: 25.w,
                        ),
        
                  ]
                  ),
              ),
        
              Container(
          height: 50.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: CustomPaint(
            painter: WavyShapePainter(),
          ),
        ),
        SizedBox(
          height: 200.h,
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Container(
                  
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12.w)),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0,1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        color: Colors.grey.shade50
                      )
                    ],          
                  ),
                  child: Column(children: [
                    Row(
                      
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Stack(
                          children: [
                             
                            Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.blue.shade50, // Specify the color of the border
                                      width: 2.0, // Specify the width of the border
                                    ),
                                  ),
                                  child: ClipOval(
                                    child: Padding(
                                      padding:  EdgeInsets.all(2.w),
                                      child: Image.network(
                                        "https://t4.ftcdn.net/jpg/00/97/58/97/360_F_97589769_t45CqXyzjz0KXwoBZT9PRaWGHRk5hQqQ.jpg",
                                        width: 50.w,
                                        height: 50.h,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                bottom: 5,
                                right: 5,
                                child: Container(
                                  width: 15.w,
                                  height: 10.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red, 
                                  ),
                                ),
                              ),
                          ],
                          
                        ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Designing",style: GoogleFonts.lexend(color: Colors.black,fontSize: 10.sp),),
                                  Text("Sr UI Designer",style: GoogleFonts.lexend(color: Colors.black,fontSize: 10.sp),),
                                  Text("Joined date: Jan 14th 2020",style: GoogleFonts.lexend(color: Colors.black,fontSize: 10.sp),),
                                ],
                              )
                      ],
                    )
                  ]),
                ),
              );
            }
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8.0),
          child: Container(
            height: 50.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(10.w)),
            ),
            child: Icon(Icons.keyboard_arrow_down,size: 25.sp,color: Colors.white,),
            
          ),
        ),
        Padding(padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 8.0,top: 8.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.w)
          ),
          child: Column(children: [
            Padding(padding: EdgeInsets.all(8.w),
            child: Text("Document Details",style: TextStyle(color: Colors.black,fontSize: 12.sp),),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                
                children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text("Bank Account",style: TextStyle(color: Colors.black,fontSize: 12.sp)),
                Text("Account No",style: TextStyle(color: Colors.black,fontSize: 12.sp)),
                Text("CIT No",style: TextStyle(color: Colors.black,fontSize: 12.sp)),
                Text("Pan No",style: TextStyle(color: Colors.black,fontSize: 12.sp)),
                Text("Citizenship No",style: TextStyle(color: Colors.black,fontSize: 12.sp)),
                
              ],),
              SizedBox(
                width: 20.w,
              ),
              Column(children: [
                Text(":",style: TextStyle(color: Colors.black,fontSize: 12.sp)),
                Text(":",style: TextStyle(color: Colors.black,fontSize: 12.sp)),
                Text(":",style: TextStyle(color: Colors.black,fontSize: 12.sp)),
                Text(":",style: TextStyle(color: Colors.black,fontSize: 12.sp)),
                Text(":",style: TextStyle(color: Colors.black,fontSize: 12.sp)),
                
              ],),
              SizedBox(
                width: 20.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("asdasdasd",style: TextStyle(color: Colors.black,fontSize: 12.sp)),
                Text("asdas",style: TextStyle(color: Colors.black,fontSize: 12.sp)),
                Text("usyiuaiu",style: TextStyle(color: Colors.black,fontSize: 12.sp)),
                Text("900dhjhjh",style: TextStyle(color: Colors.black,fontSize: 12.sp)),
                Text("usauiisa",style: TextStyle(color: Colors.black,fontSize: 12.sp)),
                
              ],),
              ],),
            )
            
            
          ]),
        ),
        )
            ],
          ),
          ),
          
        ),
      );
  }
}