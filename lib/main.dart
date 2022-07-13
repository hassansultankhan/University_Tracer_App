import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(MaterialApp(
      title: 'University Tracer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme(
          primary: Color.fromARGB(255, 246, 244, 229),
          primaryVariant: Color.fromARGB(255, 246, 244, 229),
          secondary: Color.fromARGB(255, 112, 220, 100),
          secondaryVariant: Colors.grey,
          surface: Colors.grey,
          background: Color.fromARGB(255, 255, 255, 255),
          error: Colors.grey,
          onPrimary: Colors.deepOrange,
          onSecondary: Colors.grey,
          onSurface: Colors.grey,
          onBackground: Colors.grey,
          onError: Colors.grey,
          brightness: Brightness.light,
          // brightness: Brightness.light,
          // primary: Color.fromARGB(255, 246, 244, 229),
          // onPrimary: Colors.deepOrange,Co
          // secondary: Color.fromARGB(255, 112, 220, 100),
          // onSecondary: Colors.grey,
          // background: Color.fromARGB(255, 255, 255, 255),
          // onBackground: Colors.grey,
          // surface: Colors.grey,
          // onSurface: Colors.grey,
          // error: Colors.grey,
          // onError: Colors.grey,
        ),
      ),
      home: homescreen()));
}
