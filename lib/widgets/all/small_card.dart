import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  const SmallCard({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width / 4,
        decoration: BoxDecoration(color: Colors.pink),
      ),
    );
  }
}
