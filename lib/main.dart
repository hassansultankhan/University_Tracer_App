import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp( MaterialApp(
    title: 'University Tracer',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromARGB(255, 246, 244, 229),
      onPrimary: Colors.deepOrange,
      secondary: Color.fromARGB(255, 112, 220, 100),
      onSecondary: Colors.grey,
      background: Color.fromARGB(255, 255, 255, 255),
      onBackground: Colors.grey,
      surface: Colors.grey,
      onSurface: Colors.grey,
      error: Colors.grey,
      onError: Colors.grey,
      ),
    ),

    home: homescreen()
  ));
}