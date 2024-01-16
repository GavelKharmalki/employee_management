
import 'package:employee_management/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:employee_management/screens/homepage.dart';

import '../model/login_request_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Instantiate ApiService
  ApiService apiService = ApiService();

  late Future<Map<String, dynamic>>? _loginFuture;
  late String token;

  @override
  void initState() {
    super.initState();
    _loginFuture = null;
    token = "";
  }

  Future<void> login(String email, String password) async {
    try {
      LoginRequestModel loginRequest =
          LoginRequestModel(email: email, password: password);
      final result = await apiService.login(loginRequest);

      if (result['success']) {
        print('Login successful');
        token = result['token'];
        print(token);
        
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      } else {
        print('Login failed: ${result['error']}');
        // Handle login failure
      }
    } catch (e) {
      print(e.toString());
      // Handle exceptions
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                style: TextStyle(color: Colors.black),
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                style: TextStyle(color: Colors.black),
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              SizedBox(height: 40,),
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
                  child: Center(child: Text('Login')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
