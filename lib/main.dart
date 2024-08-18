import 'package:flutter/material.dart';
import 'package:product_list_with_cart/screens/main_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: "RedHat",
      ),
      home: const Scaffold(
        body: MainScreen(),
      ),
    ),
  );
}
