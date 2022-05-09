import 'package:flutter/material.dart';
import 'package:flutter_restaurantfinder/screens/all/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Finder',
      theme: ThemeData(
        primaryColor: Colors.pinkAccent[700],
      ),
      home: HomeScreen(),
    );
  }
}
