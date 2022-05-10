import 'package:flutter/material.dart';
import 'package:flutter_restaurantfinder/model/all/restaurant.dart';

class RateGenerator extends StatelessWidget {
  const RateGenerator(
      {Key key, @required this.restaurant, @required this.small})
      : super(key: key);

  final Restaurant restaurant;
  final bool small;

  @override
  Widget build(BuildContext context) {
    double sizeIcon = small ? 19 : 24;
    return Row(
      children: [
        for (int i = 0; i < restaurant.rate.floor(); i++)
          Icon(
            Icons.star,
            color: Colors.white,
            size: sizeIcon,
          ),
        if (restaurant.rate.toInt() != restaurant.rate)
          Icon(Icons.star_half, color: Colors.white, size: sizeIcon),
      ],
    );
  }
}
