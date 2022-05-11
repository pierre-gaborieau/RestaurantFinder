import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurantfinder/screens/all/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
            .copyWith(secondary: Color(0xFFC2185B)),
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
      ),
      initial: AdaptiveThemeMode.light,
      builder: (light, dark) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: light,
          darkTheme: dark,
          title: 'Restaurant Finder',
          home: HomeScreen(),
        );
      },
    );
  }
}
