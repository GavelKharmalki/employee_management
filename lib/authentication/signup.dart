import 'package:employee_management/screens/homepage.dart';
import 'package:employee_management/service/api_service';
import 'package:flutter/material.dart';


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

  late Future<Map<String, dynamic>> _loginFuture;
  late String token;
  @override
  void initState() {
    super.initState();
    _loginFuture = Future.value({'success': false});
    token = "";
    
  }

  void login(String email, String password) {
    setState(() {
      _loginFuture = apiService.login(email, password);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Api'),
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
                  login(emailController.text.toString(), passwordController.text.toString());
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
              SizedBox(height: 20),
              FutureBuilder<Map<String, dynamic>>(
                future: _loginFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    // Show an error message using SnackBar
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar( 
                          content: Text('An error occurred: ${snapshot.error}'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    });
                    return Container();
                  } else {
                    if (snapshot.data!['success']) {
                      // Do something if login is successful
                      print('Login successful');
                      // Extract and store the token
                      token = snapshot.data!['token'];
                      print(token);
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Login Succesfull'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      });
                      Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                    } else {
                      // Show an error message using SnackBar
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Login failed: ${snapshot.data!['error']}'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      });
                    }
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
