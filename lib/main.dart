import 'package:employee_management/authentication/signup.dart';
import 'package:employee_management/providers/mainscreenprovider.dart';
import 'package:employee_management/screens/homepage.dart';
import 'package:employee_management/screens/mainscreen.dart';
import 'package:employee_management/screens/profilescreen.dart';
import 'package:employee_management/screens/scanscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider( // Use MultiProvider instead of ChangeNotifierProvider
      providers: [
        ChangeNotifierProvider(create: (context) => MainScreenProvider()),
        //ChangeNotifierProvider(create: (context) => SignUpProvider()), // Add SignUpProvider
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: child,
          );
        },
        child: const MainScreen(userId: "gavel",token: '1223'),
      ),
    );
  }
}