
import 'dart:developer';

import 'package:employee_management/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:employee_management/screens/homepage.dart';

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
            builder: (context) =>  MyHomePage(),
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
        title: const Text('Login Page'),
      ),
      body: isLoading? 
      const Center(
        child: CircularProgressIndicator(),
      ):
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                style: const TextStyle(color: Colors.black),
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 40,),
              GestureDetector(
                onTap: () {
                  login(emailController.text.toString(),
                      passwordController.text.toString());
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(child: Text('Login')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
