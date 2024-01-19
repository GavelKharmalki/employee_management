import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

 Widget verticalLineWithIcons() {
  return DottedLine(
  direction: Axis.horizontal,
  alignment: WrapAlignment.center,
  lineLength: double.infinity,
  lineThickness: 1.0,
  dashLength: 4.0,
  dashColor: Colors.black,
  dashGradient: [Colors.red, Colors.blue],
  dashRadius: 0.0,
  dashGapLength: 4.0,
  dashGapColor: Colors.transparent,
  dashGapGradient: [Colors.red, Colors.blue],
  dashGapRadius: 0.0,
);

}

Widget timeBoxes(String title, String subTitle,IconData iconData) {
  return Container(
    padding: EdgeInsets.all(8.w),
    width: 120.w,
    height: 60.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.w),
      color: Colors.white,
    ),
    child: Row(
      children: [
        // Icon(iconData, color: Colors.green),
        // SizedBox(width: 4.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.lexend(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                subTitle,
                style: GoogleFonts.lexend(
                  color: Colors.grey,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.normal,
                ),
                
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget timeButtons(String buttonTitle, String buttonSubTitle,IconData buttonIconData) {
  return Container(
    padding: EdgeInsets.all(8.w),
     width: 155.w,
    height: 60.h,
                   decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10.w),
                   color: Colors.white,
                   boxShadow:  [
                                    BoxShadow(
                                      color: Colors.grey.shade200,
                                      //color: Colors.black,
                                      blurRadius: 5,
                                      spreadRadius: 0,
                                      offset: Offset(0,0)
                                    )
                                  ]
                  ),
                  
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(buttonTitle,style: GoogleFonts.lexend(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.normal ),overflow: TextOverflow.ellipsis,),
                              SizedBox(
                                height: 5.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.w),
                                  color: Colors.orangeAccent,
                                  
                                ),
                                child: 
                                   Padding(
                                     padding:  EdgeInsets.all(4.w),
                                     child: Text(buttonSubTitle,style: GoogleFonts.lexend(color: Colors.white,fontSize: 10.sp,fontWeight: FontWeight.bold )),
                                   ),
                                ),
                            ],
                          ),
                        ),
                        
                        Icon(buttonIconData,color: Colors.deepPurple,), 
                      ],
                    ),
              );
}

Widget timeButtons2(String buttonTitle, String buttonSubTitle,IconData buttonIconData, bool rotateIcon) {
  return Container(
    padding: EdgeInsets.all(8.w),
     width: 155.w,
    height: 60.h,
                   decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10.w),
                   color: Colors.white,
                   boxShadow:  [
                                    BoxShadow(
                                      color: Colors.grey.shade200,
                                      //color: Colors.black,
                                      blurRadius: 5,
                                      spreadRadius: 0,
                                      offset: Offset(0,0)
                                    )
                                  ]
                  ),
                  
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        rotateIcon?Transform.rotate(
  angle: 90 * (3.141592653589793 / 180), // Rotate 90 degrees (in radians) for horizontal rotation
  child: Icon(
    buttonIconData,
    size: 24.0,
    color: Colors.deepPurple,
  ),
):Icon(buttonIconData,color: Colors.deepPurple,), 
                        
                       SizedBox(
                        width: 5.w,
                       ) ,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(buttonTitle,style: GoogleFonts.lexend(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.normal ),overflow: TextOverflow.ellipsis,),
                              SizedBox(
                                height: 5.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.w),
                                  color: Colors.white,
                                  
                                ),
                                child: 
                                   Padding(
                                     padding:  EdgeInsets.all(4.w),
                                     child: Text(buttonSubTitle,style: GoogleFonts.lexend(color: Colors.grey.shade300,fontSize: 10.sp,fontWeight: FontWeight.bold )),
                                   ),
                                ),
                            ],
                          ),
                        ),
                        
                        
                      ],
                    ),
              );
}
Widget overTimeButton(BuildContext context) {
  return Padding(
    padding:  EdgeInsets.only(left: 8.w,right: 10.w),
    child: Container(
      width: 310.w,
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.w),
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
      child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Overtime",style: GoogleFonts.lexend(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.normal ),overflow: TextOverflow.ellipsis,),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.w),
                                    color: Colors.white,
                                  ),
                                  child: 
                                     Padding(
                                       padding:  EdgeInsets.all(4.w),
                                       child: Text("Late: 10 minutes",style: GoogleFonts.lexend(color: Colors.grey.shade400,fontSize: 10.sp,fontWeight: FontWeight.bold )),
                                     ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        
                        const Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.punch_clock_rounded,color: Colors.deepPurple,),
                        ), 
                      ],
                    ),
    ),
  );
}


//Text("08:10 AM",style: GoogleFonts.lexend(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.normal )),
//Text("Actual check in",style: GoogleFonts.lexend(color: Colors.grey,fontSize: 14.sp,fontWeight: FontWeight.normal )),
//Icon(Icons.check_circle,color: Colors.green,),