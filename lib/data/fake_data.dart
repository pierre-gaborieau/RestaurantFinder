import 'package:flutter_restaurantfinder/model/all/restaurant.dart';

class FakeData {
  static List<Restaurant> listRestaurant = [
    Restaurant("MagDo", 2.5),
    Restaurant("Phuong Thuy", 2),
    Restaurant("Chez Maman", 4.5),
    Restaurant("Fournil d'Anthony", 5),
  ];

  static List<Restaurant> orderByRate() {
    List<Restaurant> temp = List.from(listRestaurant);
    temp.sort(((a, b) => a.rate.compareTo(b.rate)));
    return temp.reversed.toList();
  }
}
