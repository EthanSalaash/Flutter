import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hospital_system/utilities/routes.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    initialRoute: "/", // Set Login page as the initial page
    getPages: routes,
  ));
}
