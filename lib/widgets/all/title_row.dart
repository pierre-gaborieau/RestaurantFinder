import 'package:flutter/material.dart';
import 'package:flutter_restaurantfinder/data/data_constant.dart';
import 'package:flutter_restaurantfinder/widgets/widgets.dart';

class TitleRow extends StatelessWidget {
  final String text;
  final Icon icon;

  const TitleRow({
    Key key,
    @required this.text,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 20,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.wavy,
                decorationColor: kPrimaryColor),
          ),
          SquareIcon(icon: icon),
        ],
      ),
    );
  }
}
