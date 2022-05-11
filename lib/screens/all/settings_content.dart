import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_restaurantfinder/data/data_constant.dart';
import 'package:flutter_restaurantfinder/widgets/all/square_icon.dart';

class SettingsContent extends StatefulWidget {
  const SettingsContent({
    Key key,
  }) : super(key: key);

  @override
  State<SettingsContent> createState() => _SettingsContentState();
}

class _SettingsContentState extends State<SettingsContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: SingleChildScrollView(
          child: Column(
        children: [
          Text(
            "Paramètres de l'application",
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Changer de thème"),
                  SquareIcon(
                      icon: Icon(Icons.dark_mode_rounded),
                      onTap: () => AdaptiveTheme.of(context).toggleThemeMode())
                ],
              ),
              onTap: () {
                AdaptiveTheme.of(context).toggleThemeMode();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: kPrimaryColor)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Position Actuelle :"),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      children: [
                        Text("23 la Chapelière 85600 Montaigu-Vendée")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Actualiser ma position"),
                        SquareIcon(
                            icon: Icon(Icons.place_outlined), onTap: () {})
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
