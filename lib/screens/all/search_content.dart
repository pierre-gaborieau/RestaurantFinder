import 'package:flutter/material.dart';

import 'package:flutter_restaurantfinder/data/data_constant.dart';
import 'package:flutter_restaurantfinder/data/fake_data.dart';
import 'package:flutter_restaurantfinder/model/all/restaurant.dart';
import 'package:flutter_restaurantfinder/widgets/all/rate_generator.dart';

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
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
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
            height: size.height / 4 * 2.9,
            child: ListView.builder(
              itemCount: resultList.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: size.height / 6,
                    width: size.width,
                    child: Stack(children: [
                      Container(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withAlpha(0),
                                Colors.black12,
                                Colors.black45
                              ]),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.00),
                          child: Container(
                              height: 40,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      resultList[index].name,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    RateGenerator(
                                        restaurant: resultList[index],
                                        small: false)
                                  ])),
                        ),
                      )
                    ]),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
