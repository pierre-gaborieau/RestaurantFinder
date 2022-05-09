import 'package:flutter/material.dart';
import 'package:flutter_restaurantfinder/data/data_constant.dart';
import 'package:flutter_restaurantfinder/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SquareIcon(
              icon: Icon(Icons.pin_drop_outlined),
            ),
            Text(
              kAppName,
              style: TextStyle(fontFamily: "Montserrat", fontSize: 20),
            ),
            SquareIcon(icon: Icon(Icons.search_outlined))
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            TitleRow(
              text: "Restaurant Aléatoire",
              icon: Icon(Icons.replay_rounded),
            ),
            TitleRow(
                text: "Tous les Restaurants",
                icon: Icon(Icons.arrow_forward_ios_rounded))
          ],
        ),
      ),
    );
  }
}
