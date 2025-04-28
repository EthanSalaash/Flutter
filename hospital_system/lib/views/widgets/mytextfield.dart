import 'package:flutter/material.dart';

myTextField({hint,icon,required controller,prefixIcon, required obscureText,}){
  return TextField(
    controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
                    hintText: hint,
                    prefixIcon: prefixIcon,
              
                        labelStyle: TextStyle(color: Colors.yellow),
                        border: OutlineInputBorder(borderSide: BorderSide(color: const Color.fromARGB(255, 255, 254, 254))),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: const Color.fromARGB(255, 255, 255, 255))),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                      ),
  

  );
}
