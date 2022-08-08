import 'package:flutter/material.dart';
import 'package:universitylist_app/login.dart';
import 'home_screen.dart';

void main() {
  runApp(MaterialApp(
      title: 'University Tracer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme(
          primary: Color.fromARGB(255, 246, 244, 229),// for inside containers
          secondary: Color.fromARGB(255, 112, 220, 100),
          surface: Colors.grey,
          background: Color.fromARGB(255, 255, 255, 255),
          error: Colors.grey,
          onPrimary: Color.fromARGB(255, 105, 85, 177),
          onSecondary: Colors.grey,
          onSurface: Colors.grey,
          onBackground: Colors.grey,
          onError: Colors.grey,
          brightness: Brightness.light,
        ),
      ),
      home: loginpage()));
}
