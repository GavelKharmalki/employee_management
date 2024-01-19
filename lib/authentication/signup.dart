
import 'dart:developer';

import 'package:employee_management/screens/mainscreen.dart';
import 'package:employee_management/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:employee_management/screens/homepage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/login_request_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool obscurePassword = true;
  // Instantiate ApiService
  ApiService apiService = ApiService();
  late String token;

  @override
  void initState() {
    super.initState();
    token = "";
  }
  void showSnackbar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.green, // Customize the background color for success
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
  Future<void> login(String email, String password) async {
    setState(() {
      isLoading = true;
    });
    try {
      LoginRequestModel loginRequest =
          LoginRequestModel(email: email, password: password);
      final result = await apiService.login(loginRequest);

      if (result['success']) {
        log('Login successful');
        token = result['token'];
        log(token);
        if(context.mounted){
        showSnackbar(context, "Successfull");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  MainScreen(
              userId: email,
              token: token,
            ),
          ),
        );
        }
        
        setState(() {
          isLoading=false;
        });
      } else {
        log('Login failed: ${result['error']}');
        if(context.mounted){
          showSnackbar(context, "Login failed");
        }
        setState(() {
          isLoading=false;
        });
        // Handle login failure
      }
    } catch (e) {
      log(e.toString());
      // Handle exceptions
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login',style: TextStyle(color: Colors.deepPurple),),
      ),
      body: isLoading? 
      const Center(
        child: CircularProgressIndicator(),
      ):
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/login.png', // Replace with your actual image asset path
                
              ),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                controller: emailController,
                decoration:  InputDecoration(
                  hintText: 'Email',
                  enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.w)),
                  borderSide: BorderSide(color: Colors.deepPurple), // Set your desired border color here
                ),
                focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.w)),
      borderSide: BorderSide(color: Colors.deepPurple), // Border color when focused
    ),
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField( 
                
                obscureText: obscurePassword,
                style: const TextStyle(color: Colors.black),
                controller: passwordController,
                decoration:  InputDecoration(
                  hintText: 'Password',
                  enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.w)),
                  borderSide: BorderSide(color: Colors.deepPurple), // Set your desired border color here
                ),
                  focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.w)),
                  borderSide: BorderSide(color: Colors.deepPurple), // Border color when focused
                ),
                suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obscurePassword = !obscurePassword; // Toggle password visibility
              });
            },
            child: Icon(
              obscurePassword ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
          ),
                ),
                
              ),
              const SizedBox(height: 40,),
              GestureDetector(
                onTap: () {
                  login(emailController.text.toString(),
                      passwordController.text.toString());
                },
                child: Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(child: Text('Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
