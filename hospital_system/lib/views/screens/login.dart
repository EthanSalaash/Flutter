import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'homescreen.dart';
import 'registration.dart';
import '../../controllers/logincontroller.dart';
import '../../configs/mycolors.dart';
import '../widgets/mybutton.dart';
import '../widgets/mytextfield.dart';

Logincontroller logincontroller = Logincontroller();
var store = GetStorage();
TextEditingController userNameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class Login extends StatelessWidget {
  const Login({super.key});

  Future<void> _login(BuildContext context) async {
    final username = userNameController.text.trim();
    final password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      logincontroller.setErrorMessage("Please fill in all fields");
      return;
    }

    try {
      final url = Uri.parse('http://localhost:5000/login.php');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200 && responseData['status'] == 'success') {
        logincontroller.setErrorMessage("");
        store.write("username", username);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login successful!")),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        logincontroller.setErrorMessage(responseData['error'] ?? "Login failed");
      }
    } catch (e) {
      logincontroller.setErrorMessage("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    String username = store.read("username") ?? "";
    userNameController.text = username;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 55, 92),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 5, 40, 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/hosp.png"),
              Text(
                'METUY HOSPITAL LOGIN SCREEN',
                style: TextStyle(
                  fontSize: 36,
                  color: const Color.fromARGB(255, 121, 3, 3),
                  fontWeight: FontWeight.bold,
                ),
              ),
              myTextField(
                hint: "Enter your username",
                obscureText: false,
                prefixIcon: const Icon(Icons.person),
                controller: userNameController,
              ),
              const SizedBox(height: 20, width: 45),
              myTextField(
                hint: "Enter your password",
                obscureText: true,
                prefixIcon: const Icon(Icons.lock),
                controller: passwordController,
              ),
              const SizedBox(height: 20),
              myButton(() => _login(context),
                  label: "Login",
                  color: const Color.fromARGB(255, 126, 181, 227)),
              const SizedBox(height: 20),
              myButton(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Registration()),
                );
              },
                  label: "Sign Up",
                  color: const Color.fromARGB(242, 67, 154, 226)),
              Obx(() => Text(
                    logincontroller.errorMessage.value,
                    style: const TextStyle(color: Colors.red),
                  )),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  logincontroller.setErrorMessage("Error Message");
                  Get.snackbar("Welcome", "Welcome to DU",
                      colorText: Colors.white,
                      backgroundColor: Colors.deepOrange,
                      snackPosition: SnackPosition.BOTTOM);
                  Get.toNamed("/register");
                },
                child: const Text("click"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Checkbox(value: true, onChanged: (val) {}),
                  const Text("Remember me"),
                  const Spacer(),
                  GestureDetector(
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                        color: secondaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {
                      print("Password recovery");
                    },
                  ),
                  Obx(() => Text(
                        logincontroller.errorMessage.value,
                        style: const TextStyle(color: Colors.red),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
