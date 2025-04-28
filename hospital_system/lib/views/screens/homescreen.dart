// ignore: unused_import
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hospital_system/controllers/homescreencontroller.dart';
import 'package:hospital_system/views/screens/dashboard.dart';
import 'package:hospital_system/views/screens/orders.dart';
import 'package:hospital_system/views/screens/products.dart';
import 'package:hospital_system/views/screens/profile.dart';
Homescreencontroller homescreencontroller=Homescreencontroller();
var myScreens=[ Dashboard(),Products(),Orders(),Profile()];

class HomeScreen extends StatelessWidget {
  const   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar:AppBar(title:Text("HOME"),backgroundColor: const Color.fromARGB(255, 69, 113, 148)),
      bottomNavigationBar: Obx(()=>BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.dashboard),label:"Dashboard"),
        BottomNavigationBarItem(icon: Icon(Icons.category),label:"Products"),
        BottomNavigationBarItem(icon: Icon(Icons.list),label:"Orders"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label:"Profile"),
      ],unselectedItemColor:Colors.black,
      selectedItemColor:Colors.deepOrange,
      currentIndex: homescreencontroller.selectedPageIndex.value,
      onTap: (index)=>homescreencontroller.updateSelection(index),
      showUnselectedLabels: true,
      )),
     body: Obx(()=>myScreens[homescreencontroller.selectedPageIndex.value]), 
    );
}
}
