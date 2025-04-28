// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hospital_system/configs/mycolors.dart';

List titles = [
  "Patient Records",
  "Doctors Preferred",
  "Schedule Planned",
  "Health Plan",
  "Branch",
  "Issues Or Complaints"
];
List iconData = [
  Icons.person,
  Icons.group,
  Icons.calendar_today,
  Icons.book,
  Icons.house,
  Icons.book_rounded
];
List values = [
  "Your Patient Records",
  "Dr Muyunga",
  "Today at 2.30pm",
  "No health plan",
  "Nairobi Branch",
  "Place your issues and complaints here"
];

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: const Color.fromARGB(255, 61, 173, 171),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Hello Patient",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
            ),
            GridView.builder(
              itemCount: titles.length,
              shrinkWrap: true, // Allows the grid to be scrollable
              physics: NeverScrollableScrollPhysics(), // Prevents the grid from conflicting with the parent scroll
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                childAspectRatio: 0.9, // Makes the boxes smaller by adjusting aspect ratio
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: mainColor.withOpacity(0.1),
                      borderRadius: BorderRadius.all(Radius.circular(20)), // Smaller radius for compact styling
                    ),
                    height: 80, // Smaller height
                    width: 80, // Smaller width
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          iconData[index],
                          size: 40, // Smaller icon size
                          color: mainColor.withOpacity(0.5),
                        ),
                        Text(
                          titles[index],
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700), // Adjusted text size
                        ),
                        Text(
                          values[index],
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500), // Adjusted text size
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
