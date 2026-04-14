import 'package:flutter/material.dart';
import 'package:flutter_application_2/homepage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Money Manager',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.teal.shade100,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal.shade400,
          titleTextStyle: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        colorScheme: .fromSeed(seedColor: Colors.teal),
      ),
      home: HomePage(),
    );
  }
}

