import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_restaurantfinder/data/data_constant.dart';
import 'package:flutter_restaurantfinder/data/fake_data.dart';
import 'package:flutter_restaurantfinder/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SquareIcon(
              icon: Icon(Icons.settings_outlined),
              onTap: () {
                log("Settings Page");
              },
            ),
            Text(
              kAppName,
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SquareIcon(
              icon: Icon(Icons.search_outlined),
              onTap: () {
                log("Search Page");
              },
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              RestaurantAleatoire(size: size),
              ListRestaurantHorizontal(
                size: size,
                title: "Tous les Restaurants",
                actionButton: () {},
                listRestaurant: FakeData.listRestaurant,
              ),
              ListRestaurantHorizontal(
                size: size,
                title: "Restaurants les mieux notés",
                actionButton: () {},
                listRestaurant: FakeData.orderByRate(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
