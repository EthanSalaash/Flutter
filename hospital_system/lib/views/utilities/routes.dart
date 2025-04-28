import 'package:get/get.dart';
import 'package:hospital_system/views/screens/homescreen.dart';
import 'package:hospital_system/views/screens/login.dart';
import 'package:hospital_system/views/screens/registration.dart';

List<GetPage> routes=[
  GetPage(name: "/", page:()=>Login()),
  GetPage(name: "/register", page:()=>Registration()),
  GetPage(name: "/homescreen", page:()=>HomeScreen()),

];