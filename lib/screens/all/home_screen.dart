import 'package:flutter/material.dart';
import 'package:flutter_restaurantfinder/screens/all/search_content.dart';

import 'package:flutter_restaurantfinder/screens/screens.dart';
import 'package:flutter_restaurantfinder/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget content;
  BottomNavBar bottomNavBar;
  BottomNavBar bottomNavBarHome;
  BottomNavBar bottomNavBarSettings;
  BottomNavBar bottomNavBarSearch;
  @override
  void initState() {
    super.initState();

    content = MainContent(
      update: _valueChanged,
    );
    bottomNavBarHome = BottomNavBar(
        actionLeft: () {
          _navigateToSettings(context);
        },
        iconActionLeft: Icon(Icons.settings_outlined),
        actionRight: () {
          _navigateToSearch(context, false);
        },
        iconActionRight: Icon(Icons.search_rounded));
    bottomNavBarSettings = BottomNavBar(
        actionLeft: () {
          _navigateToHome(context);
        },
        iconActionLeft: Icon(Icons.home_outlined),
        actionRight: () {
          _navigateToSearch(context, false);
        },
        iconActionRight: Icon(Icons.search_rounded));
    bottomNavBarSearch = BottomNavBar(
        actionLeft: () {
          _navigateToSettings(context);
        },
        iconActionLeft: Icon(Icons.settings_outlined),
        actionRight: () {
          _navigateToHome(context);
        },
        iconActionRight: Icon(Icons.home_outlined));
    bottomNavBar = bottomNavBarHome;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavBar,
      body: content,
    );
  }

  void _navigateToSettings(BuildContext context) async {
    setState(() {
      content = SettingsContent();
      bottomNavBar = bottomNavBarSettings;
    });
  }

  void _navigateToHome(BuildContext context) async {
    setState(() {
      content = MainContent(
        update: _valueChanged,
      );
      bottomNavBar = bottomNavBarHome;
    });
  }

  void _navigateToSearch(BuildContext context, bool isRate) async {
    setState(() {
      content = SearchContent(isRate: isRate);
      bottomNavBar = bottomNavBarSearch;
    });
  }

  _valueChanged(bool value) {
    _navigateToSearch(context, value);
  }
}
