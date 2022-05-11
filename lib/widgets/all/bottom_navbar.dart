import 'package:flutter/material.dart';
import 'package:flutter_restaurantfinder/data/data_constant.dart';
import 'package:flutter_restaurantfinder/widgets/widgets.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
    @required this.iconActionLeft,
    @required this.actionLeft,
    @required this.iconActionRight,
    @required this.actionRight,
  }) : super(key: key);

  final Icon iconActionLeft;
  final Function actionLeft;
  final Icon iconActionRight;
  final Function actionRight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SquareIcon(
            icon: iconActionLeft,
            onTap: actionLeft,
          ),
          Text(
            kAppName,
            style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SquareIcon(
            icon: iconActionRight,
            onTap: actionRight,
          )
        ],
      ),
    );
  }
}
