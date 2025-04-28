import 'package:flutter/material.dart';
import 'package:hospital_system/views/widgets/mytextfield.dart';
import 'package:hospital_system/views/screens/homescreen.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override

  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 9, 58, 99),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign Up',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.yellow),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: myTextField(hint: "First Name", obscureText: false, controller: userNameController),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: myTextField(hint: "Last Name", obscureText: false, controller: userNameController),
                  ),
                ],
              ),
              SizedBox(height: 15),
              myTextField(hint: "Username", obscureText: false, prefixIcon: Icon(Icons.person), controller: userNameController),
              SizedBox(height: 15),
              myTextField(hint: "Email", obscureText: false, controller: userNameController),
              SizedBox(height: 15),
              myTextField(hint: "Password", obscureText: true, prefixIcon: Icon(Icons.lock), controller: passwordController),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to HomeScreen after sign-up
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.grey[700],
                      ),
                      child: Text('Sign Up', style: TextStyle(fontSize: 18, color: Colors.yellow)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'By signing up, you agree to our terms of service and privacy policy.',
                style: TextStyle(fontSize: 12, color: Colors.yellow),
              ),
              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'If you already have an account...go back to login page',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.yellow),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
