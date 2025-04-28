// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hospital_system/configs/mycolors.dart';
import 'package:hospital_system/controllers/logincontroller.dart';
import 'package:hospital_system/views/widgets/mybutton.dart';
import 'package:hospital_system/views/widgets/mytextfield.dart';
import 'package:hospital_system/views/screens/registration.dart';
import 'package:hospital_system/views/screens/homescreen.dart';

Logincontroller logincontroller = Logincontroller();
var store = GetStorage();
TextEditingController userNameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class Login extends StatelessWidget {
  const Login({super.key});
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
                    fontWeight: FontWeight.bold),
              ),
              myTextField(
                  hint: "Enter your username",
                  obscureText: false,
                  prefixIcon: Icon(Icons.person),
                  controller: userNameController),
              SizedBox(height: 20, width: 45),
              myTextField(
                  hint: "Enter your password",
                  obscureText: true,
                  prefixIcon: Icon(Icons.lock),
                  controller: passwordController),
              SizedBox(height: 20),
              myButton(() async {
                // Add your login validation logic here
                print("Log in");
                store.write("username", userNameController.text);

                // Navigate to HomeScreen after successful login
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
                  label: "Login",
                  color: const Color.fromARGB(255, 126, 181, 227)),
              SizedBox(height: 20),
              myButton(() {
                print("Navigating to Sign Up");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Registration()),
                );
              },
                  label: "Sign Up",
                  color: const Color.fromARGB(242, 67, 154, 226)),
              Obx(() => Text(logincontroller.errorMessage.value)),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                onPressed: () {
                  logincontroller.setErrorMessage("Error Message");
                  Get.snackbar("Welcome", "Welcome to DU",
                      colorText: Colors.white,
                      backgroundColor: Colors.deepOrange,
                      snackPosition: SnackPosition.BOTTOM);
                  Get.toNamed("/register");
                },
                child: Text("click"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Checkbox(value: true, onChanged: (val) {}),
                  Text("Remember me"),
                  Spacer(),
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
                  Obx(() => Text(logincontroller.errorMessage.value)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
