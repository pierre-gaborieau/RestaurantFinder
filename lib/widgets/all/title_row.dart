import 'package:flutter/material.dart';
import 'package:flutter_restaurantfinder/widgets/widgets.dart';

class TitleRow extends StatelessWidget {
  final String text;
  final Icon icon;
  final Function onTap;

  const TitleRow(
      {Key key, @required this.text, @required this.icon, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            // decoration: TextDecoration.underline,
            // decorationStyle: TextDecorationStyle.wavy,
            // decorationColor: kPrimaryColor
          ),
        ),
        SquareIcon(
          icon: icon,
          onTap: onTap,
        ),
      ],
    );
  }
}
