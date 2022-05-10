import 'package:flutter/material.dart';
import 'package:flutter_restaurantfinder/model/all/restaurant.dart';
import 'package:flutter_restaurantfinder/widgets/widgets.dart';

class ListRestaurantHorizontal extends StatelessWidget {
  final String title;
  final Function actionButton;
  final List<Restaurant> listRestaurant;
  final Size size;

  const ListRestaurantHorizontal(
      {Key key, this.title, this.actionButton, this.listRestaurant, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleRow(
          text: title,
          icon: Icon(Icons.arrow_forward_ios_rounded),
          onTap: actionButton,
        ),
        SizedBox(
            height: size.height / 5,
            width: size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listRestaurant.length,
                itemBuilder: ((context, index) => SmallCard(
                      size: size,
                      restaurant: listRestaurant[index],
                    ))))
      ],
    );
  }
}
