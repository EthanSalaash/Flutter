import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
        return Scaffold(
appBar:AppBar(title:Text("Orders"),backgroundColor: const Color.fromARGB(255, 16, 130, 128)),
body: Text("THIS IS THE ORDERS PAGE"),
    );
  }
}