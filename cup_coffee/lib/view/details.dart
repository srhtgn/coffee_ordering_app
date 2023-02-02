import 'package:cup_coffee/constant/colors.dart';
import 'package:cup_coffee/constant/images.dart';
import 'package:cup_coffee/constant/text_styles.dart';
import 'package:cup_coffee/view/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_button/group_button.dart';
import 'package:unicons/unicons.dart';

class Details extends StatefulWidget {
  // const Details({Key? key}) : super(key: key);

  String name;
  double rating;
  double price;
  String image;
  int time;

  Details({
    required this.name,
    required this.rating,
    required this.price,
    required this.image,
    required this.time,
  });

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  double sizedPrice = 0;
  int piece = 1;
  int size = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          title: Text('Details',
              style: TextStyles().w600_s18),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(UniconsLine.heart))
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 35, right: 8, left: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: NetworkImage(widget.image),
                  width: double.maxFinite,
                  height: 330,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
                padding:
                    EdgeInsets.only(top: 10, right: 30, left: 30, bottom: 20),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(widget.name,
                              style: TextStyles().black_w600_s24),
                          Spacer(),
                          Icon(Icons.star, color: Colors.yellow),
                          Text('${widget.rating}',
                              style: TextStyles().black_w500_s18),
                        ],
                      ),
                      Text('₺${widget.price}',
                          style: TextStyles().black_w500_s20),
                      Text(
                          'A cappuccino is an espresso-based coffee drink that originated in Austria with later development taking place in Italy..Read more',
                          style: TextStyles().grey_w400_s16),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Spacer(),
                          Container(
                            height: 63,
                            width: 63,
                            decoration: BoxDecoration(
                                color: CustomColors().customFadeOrange,
                                borderRadius: BorderRadius.circular(20)),
                            child: Image(
                                image: ImageItems().coffeeBeansImage,
                                color: CustomColors().customOrange),
                          ),
                          Spacer(),
                          Container(
                            height: 63,
                            width: 63,
                            decoration: BoxDecoration(
                                color: CustomColors().customFadeOrange,
                                borderRadius: BorderRadius.circular(20)),
                            child: Image(
                                image: ImageItems().milkCartonImage,
                                color: CustomColors().customOrange),
                          ),
                          Spacer(),
                          Container(
                            height: 63,
                            width: 63,
                            decoration: BoxDecoration(
                                color: CustomColors().customFadeOrange,
                                borderRadius: BorderRadius.circular(20)),
                            child: Image(
                                image: ImageItems().whippedCreamImage,
                                color: CustomColors().customOrange),
                          ),
                          Spacer(),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text('Choose size',
                          style: TextStyles().black_w600_s18),
                      GroupButton(
                        options: GroupButtonOptions(
                          selectedColor: CustomColors().customDarkGreen,
                          unselectedBorderColor: CustomColors().customDarkGreen,
                          buttonWidth: 90,
                          buttonHeight: 37,
                          borderRadius: BorderRadius.circular(10),
                          spacing: 15,
                          groupingType: GroupingType.wrap,
                          selectedTextStyle: TextStyles().white_w500_s18,
                          unselectedTextStyle: TextStyles().customDarkGreen_w500_s18,
                        ),
                        isRadio: true,
                        buttons: ['100 ml', '250 ml', '500 ml'],
                        maxSelected: 1,
                        onSelected: (value, index, isSelected) {
                          switch (index) { //Seçilen butonun indexine göre ürün fiyatının değiştirilmesi
                            case 0:
                              {
                                sizedPrice = widget.price;
                                size = 100;
                                break;
                              }
                            case 1:
                              {
                                sizedPrice = widget.price * 2.5;
                                size = 250;
                                break;
                              }
                            case 2:
                              {
                                sizedPrice = widget.price * 5;
                                size = 500;
                                break;
                              }
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (piece > 1) {
                                setState(() {
                                  piece -= 1; //ürün adedi değerini azaltmak
                                });
                              }
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: CustomColors().customFadeOrange,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Icon(UniconsLine.minus,
                                  color: CustomColors().customOrange),
                            ),
                          ),
                          Spacer(),
                          Text('${piece}',
                              style: TextStyles().black_w400_s20),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              setState(() {
                                piece += 1; //ürün adedi değerini arttırmak
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: CustomColors().customOrange,
                                  borderRadius: BorderRadius.circular(8)),
                              child:
                                  Icon(UniconsLine.plus, color: Colors.white),
                            ),
                          ),
                          Spacer(),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Order( //Gerekli verilerin Order sayfasına gönderilmei
                                            name: widget.name,
                                            image: widget.image,
                                            piece: piece,
                                            price: sizedPrice,
                                            time: widget.time,
                                            size: size)));
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: CustomColors().customDarkGreen,
                                  minimumSize: Size(180, 45),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              child: Text('Add to cart',
                                  style: TextStyles().white_w400_s18))
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ));
  }
}
