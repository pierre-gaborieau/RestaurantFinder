import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_restaurantfinder/data/data_constant.dart';
import 'package:flutter_restaurantfinder/data/fake_data.dart';
import 'package:flutter_restaurantfinder/model/all/restaurant.dart';
import 'package:flutter_restaurantfinder/widgets/widgets.dart';

class RestaurantAleatoire extends StatefulWidget {
  const RestaurantAleatoire({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<RestaurantAleatoire> createState() => _RestaurantAleatoireState();
}

class _RestaurantAleatoireState extends State<RestaurantAleatoire> {
  Restaurant restaurant;
  @override
  void initState() {
    restaurant = FakeData
        .listRestaurant[Random().nextInt(FakeData.listRestaurant.length)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleRow(
          text: "Restaurant Aléatoire",
          icon: Icon(Icons.replay_rounded),
          onTap: () {
            setState(() {
              var previous = restaurant;
              do {
                restaurant = FakeData.listRestaurant[
                    Random().nextInt(FakeData.listRestaurant.length)];
              } while (restaurant == previous);
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
          child: Container(
            height: widget.size.height / 4,
            width: widget.size.width,
            child: Stack(children: [
              Container(
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
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      height: 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurant.name,
                            style: TextStyle(color: Colors.white),
                          ),
                          RateGenerator(
                            restaurant: restaurant,
                            small: false,
                          )
                        ],
                      ),
                    )),
              )
            ]),
          ),
        ),
      ],
    );
  }
}
