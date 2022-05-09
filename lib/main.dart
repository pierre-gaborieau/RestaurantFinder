import 'package:flutter/material.dart';
import 'package:flutter_restaurantfinder/model/darktheme/dark_theme_provider.dart';
import 'package:flutter_restaurantfinder/model/darktheme/styles.dart';
import 'package:flutter_restaurantfinder/screens/all/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeProvider.darkTheme =
        await themeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Finder',
      theme: Styles.themeData(themeProvider.darkTheme, context),
      home: HomeScreen(),
    );
  }
}
