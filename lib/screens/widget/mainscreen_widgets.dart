import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget timeBoxes(String title, String subTitle,IconData iconData) {
  return Container(
    padding: EdgeInsets.all(8.w),
    width: 155.w,
    height: 60.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.w),
      color: Colors.white,
    ),
    child: Row(
      children: [
        Icon(iconData, color: Colors.green),
        SizedBox(width: 4.w),
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
                  fontSize: 14.sp,
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

Widget overTimeButton(BuildContext context) {
  return Padding(
    padding:  EdgeInsets.only(left: 8.w),
    child: Container(
      width: MediaQuery.sizeOf(context).width,
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
    
      ),
    ),
  );
}


//Text("08:10 AM",style: GoogleFonts.lexend(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.normal )),
//Text("Actual check in",style: GoogleFonts.lexend(color: Colors.grey,fontSize: 14.sp,fontWeight: FontWeight.normal )),
//Icon(Icons.check_circle,color: Colors.green,),