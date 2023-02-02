import 'package:cup_coffee/constant/images.dart';
import 'package:cup_coffee/constant/text_styles.dart';
import 'package:cup_coffee/viewmodel/asley_cafe_products.dart';
import 'package:cup_coffee/viewmodel/bunny_cafe_products.dart';
import 'package:cup_coffee/viewmodel/old_town_cafe_products.dart';
import 'package:flutter/material.dart';

class Reserve extends StatefulWidget {
  // const Reserve({Key? key}) : super(key: key);
  String name;

  Reserve({required this.name});

  @override
  State<Reserve> createState() => _ReserveState();
}

class _ReserveState extends State<Reserve> {
  Widget cafeReserves() { //Seçilen kafenin ismine göre ilgili kafenin ürünler sayfasına git
    var cafeReserves;
    switch (widget.name) {
      case 'Asley Cafe':
        {
          cafeReserves = AsleyCafeReserves();
          break;
        }
      case 'Bunny Cafe':
        {
          cafeReserves = BunnyCafeReserves();
          break;
        }
      case 'Old Town Cafe':
        {
          cafeReserves = OldTownCafeReserves();
          break;
        }
    }
    return cafeReserves;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          title: Text(widget.name, style: TextStyles().w500_s18),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.white,
                        width: double.maxFinite,
                        height: 105,
                        child: Row(
                          children: [
                            Image(image: ImageItems().asleyCafeImage),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Reserve a table now',
                                    style: TextStyles().black_w600_s18),
                                Container(
                                  width: 140,
                                  height: 40,
                                  child: Text(
                                      'Lorem ipsum dolor sit amet, cons ectetur adipiscing elit',
                                      style: TextStyles().grey500_w400_s14),
                                )
                              ],
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_forward_ios))
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text('Coffee',
                              style: TextStyles().black_w600_s18),
                          Spacer(),
                          Text('Cakes',
                              style: TextStyles().grey_w400_s18),
                          Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.display_settings,
                                  color: Colors.grey)),
                        ],
                      ),
                      Text("Today's special",
                          style: TextStyles().black_w600_s20)
                    ],
                  )),
              SizedBox(height: 20),

              Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Container(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height,
                    child: cafeReserves(),
                  ))
            ],
          ),
        ));
  }
}
