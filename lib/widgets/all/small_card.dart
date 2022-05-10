import 'package:flutter/material.dart';
import 'package:flutter_restaurantfinder/model/all/restaurant.dart';
import 'package:flutter_restaurantfinder/widgets/widgets.dart';

class SmallCard extends StatelessWidget {
  final Restaurant restaurant;
  const SmallCard({Key key, @required this.size, @required this.restaurant})
      : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width / 4,
        child: Stack(children: [
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.black.withAlpha(0),
                  Colors.black12,
                  Colors.black45
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style: TextStyle(color: Colors.white),
                    ),
                    RateGenerator(restaurant: restaurant, small: true)
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
