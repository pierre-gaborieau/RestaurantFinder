import 'package:flutter/material.dart';

import 'package:flutter_restaurantfinder/data/data_constant.dart';
import 'package:flutter_restaurantfinder/data/fake_data.dart';
import 'package:flutter_restaurantfinder/model/all/restaurant.dart';

class SearchContent extends StatefulWidget {
  final bool isRate;
  const SearchContent({
    Key key,
    @required this.isRate,
  }) : super(key: key);

  @override
  State<SearchContent> createState() => _SearchContentState();
}

class _SearchContentState extends State<SearchContent> {
  List<Restaurant> resultList;
  String title;
  @override
  void initState() {
    super.initState();
    title = widget.isRate ? "Restaurants par Note" : "Tous les Restaurants";
    resultList =
        widget.isRate ? FakeData.orderByRate() : FakeData.listRestaurant;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: kPrimaryColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      resultList = widget.isRate
                          ? FakeData.orderByRate()
                              .where((element) => element.name
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList()
                          : FakeData.listRestaurant
                              .where((element) => element.name
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                    });
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Rechercher des restaurants..."),
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: Text(
              title,
              style: TextStyle(color: Colors.pink[100]),
            ),
          ),
          SizedBox(
            height: double.maxFinite,
            child: ListView.builder(
              itemCount: resultList.length,
              itemBuilder: ((context, index) {
                return Text(resultList[index].name);
              }),
            ),
          )
        ],
      )),
    );
  }
}
