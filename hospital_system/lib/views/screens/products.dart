import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
return Scaffold(
appBar:AppBar(title:Text("PRODUCTS"),backgroundColor: const Color.fromARGB(255, 16, 130, 128)),
body: Text("THIS IS THE PRODUCTS PAGE"),
    );
  }
}