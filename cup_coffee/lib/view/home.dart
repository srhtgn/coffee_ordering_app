import 'package:cup_coffee/constant/images.dart';
import 'package:cup_coffee/constant/text_styles.dart';
import 'package:cup_coffee/viewmodel/asley_cafe_products.dart';
import 'package:cup_coffee/viewmodel/bunny_cafe_products.dart';
import 'package:cup_coffee/viewmodel/nearest_cafes.dart';
import 'package:cup_coffee/viewmodel/old_town_cafe_products.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 50, right: 20, left: 20),
                  child: Row(
                    children: [
                      Container(
                          width: 247,
                          height: 84,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('Get your ',
                                      style: TextStyles().black_w600_s28),
                                  Text('Coffee',
                                      style: TextStyles().customOrange_w600_s28),
                                ],
                              ),
                              Text('on one finger tap',
                                  style: TextStyles().black_w600_s28),
                            ],
                          )),
                      Spacer(),
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: ImageItems().userImage,
                      )
                    ],
                  )),
              SizedBox(height: 20),
              Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(right: 20, left: 20),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Search anything',
                      hintStyle: TextStyles().greyHint,
                      suffixIcon: Icon(Icons.search, color: Colors.grey),
                      fillColor: Colors.grey[250],
                      filled: true,
                    ),
                  )),
              SizedBox(height: 20),
              Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: Text('Popular Coffee',
                      style: TextStyles().black_wBold_s28)),
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Container(
                        width: double.maxFinite,
                        height: 275,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              width: 275,
                              height: MediaQuery.of(context).size.height,
                              child: AsleyCafePopularProducts(),
                            ),
                            Container(
                              width: 275,
                              height: MediaQuery.of(context).size.height,
                              child: BunnyCafePopularProducts(),
                            ),
                            Container(
                                width: 275,
                                height: MediaQuery.of(context).size.height,
                                child: OldTownCafePopularProducts()
                            )
                          ],
                        )
                        ),
                  ),
              Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    children: [
                      Text('Nearest coffee shops',
                          style: TextStyles().black_w600_s20),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Container(
                    width: double.maxFinite,
                    height: 221,
                    child: NearestCafes(),
                  )),
            ],
    )));
  }
}
