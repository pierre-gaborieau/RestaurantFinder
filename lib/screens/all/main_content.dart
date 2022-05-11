import 'package:flutter/material.dart';

import 'package:flutter_restaurantfinder/data/data_constant.dart';
import 'package:flutter_restaurantfinder/data/fake_data.dart';
import 'package:flutter_restaurantfinder/widgets/widgets.dart';

class MainContent extends StatelessWidget {
  final ValueChanged<bool> update;
  const MainContent({
    Key key,
    @required this.update,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            RestaurantAleatoire(size: size),
            ListRestaurantHorizontal(
              size: size,
              title: "Tous les Restaurants",
              actionButton: () => update(false),
              listRestaurant: FakeData.listRestaurant,
            ),
            ListRestaurantHorizontal(
              size: size,
              title: "Restaurants les mieux notés",
              actionButton: () => update(true),
              listRestaurant: FakeData.orderByRate(),
            )
          ],
        ),
      ),
    );
  }
}
