import 'package:flutter/material.dart';
import 'package:flutter_restaurantfinder/data/data_constant.dart';

class SquareIcon extends StatelessWidget {
  final Icon icon;

  const SquareIcon({
    Key key,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: icon,
      ),
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(5)),
    );
  }
}
