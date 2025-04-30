import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'homescreen.dart';
import '../widgets/mytextfield.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    Future<void> _register() async {
      final firstName = firstNameController.text.trim();
      final lastName = lastNameController.text.trim();
      final username = usernameController.text.trim();
      final email = emailController.text.trim();
      final password = passwordController.text;

      if (firstName.isEmpty ||
          lastName.isEmpty ||
          username.isEmpty ||
          email.isEmpty ||
          password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill in all fields')),
        );
        return;
      }

      final url = Uri.parse('http://localhost:5000/register.php');

      try {
        final response = await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'firstname': firstName,
            'lastname': lastName,
            'username': username,
            'email': email,
            'password': password,
          }),
        );

        final responseData = jsonDecode(response.body);

        if (response.statusCode == 200 && responseData['status'] == 'success') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration successful!')),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(responseData['error'] ?? 'Registration failed')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 9, 58, 99),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign Up',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.yellow),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: myTextField(hint: "First Name", obscureText: false, controller: firstNameController),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: myTextField(hint: "Last Name", obscureText: false, controller: lastNameController),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              myTextField(
                hint: "Username",
                obscureText: false,
                prefixIcon: const Icon(Icons.person),
                controller: usernameController,
              ),
              const SizedBox(height: 15),
              myTextField(hint: "Email", obscureText: false, controller: emailController),
              const SizedBox(height: 15),
              myTextField(
                hint: "Password",
                obscureText: true,
                prefixIcon: const Icon(Icons.lock),
                controller: passwordController,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _register,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.grey[700],
                      ),
                      child: const Text('Sign Up', style: TextStyle(fontSize: 18, color: Colors.yellow)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'By signing up, you agree to our terms of service and privacy policy.',
                style: TextStyle(fontSize: 12, color: Colors.yellow),
              ),
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
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
