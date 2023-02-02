import 'package:cup_coffee/constant/colors.dart';
import 'package:cup_coffee/constant/text_styles.dart';
import 'package:cup_coffee/view/processing.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class Order extends StatefulWidget {
  // const Order({Key? key}) : super(key: key);

  String name;
  String image;
  int piece;
  double price;
  int time;
  int size;

  Order({
    required this.name,
    required this.image,
    required this.piece,
    required this.price,
    required this.time,
    required this.size,
  });

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    double subtotal = widget.price * widget.piece; //Fiyatlandırma işlemleri
    double discount = subtotal / 100 * 16;
    int delivery = widget.time * 5 * widget.piece;
    double total = subtotal - discount + delivery;
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          title: Text('Place order',
              style: TextStyles().w500_s18),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.only(right: 20, left: 20, bottom: 20),
          child: Column(
            children: [
              Container(
                height: 220,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.5, color: Colors.black),
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        Spacer(),
                        Icon(Icons.location_on_outlined,
                            size: 30, color: CustomColors().customOrange),
                        Spacer(),
                        Container(
                          width: 220,
                          height: 70,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Hotel Diamond Palace',
                                  style: TextStyles().black_w600_s18),
                              Text('394K, Central Park, New Delhi, India',
                                  style: TextStyles().grey500_w400_s14)
                            ],
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: CustomColors().customFadeOrange,
                                borderRadius: BorderRadius.circular(8)),
                            child: Icon(UniconsLine.edit,
                                color: CustomColors().customOrange),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    // SizedBox(height: 30),
                    Spacer(),
                    Row(
                      children: [
                        Spacer(),
                        Icon(Icons.drive_eta_outlined,
                            size: 30, color: CustomColors().customOrange),
                        Spacer(),
                        Container(
                          width: 220,
                          height: 70,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Middle road Sediago',
                                  style: TextStyles().black_w600_s18),
                              Text(
                                  '201, sector 25, Centre Park, New Delhi, India',
                                  style: TextStyles().grey500_w400_s14),
                            ],
                          ),
                        ),
                        Spacer(),
                        SizedBox(width: 40, height: 40),
                        Spacer(),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Spacer(),
              Container(
                color: Colors.white,
                width: double.maxFinite,
                height: 105,
                child: Row(
                  children: [
                    Image(image: NetworkImage(widget.image)),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${widget.name}',
                            style: TextStyles().black_w600_s18),
                        Container(
                          width: 140,
                          height: 40,
                          child: Text('${widget.size} ml',
                              style: TextStyles().grey500_w400_s14),
                        )
                      ],
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        if (widget.piece > 1) {
                          setState(() {
                            widget.piece -= 1; //ürün adedi değerini azaltmak
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
                    Text('${widget.piece}',
                        style: TextStyles().black_w500_s20),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          widget.piece += 1; //ürün adedi değerini arttırmak
                        });
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: CustomColors().customOrange,
                            borderRadius: BorderRadius.circular(8)),
                        child: Icon(UniconsLine.plus, color: Colors.white),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Spacer(),
              Container(
                width: double.maxFinite,
                height: 250,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Spacer(),
                      Row(
                        children: [
                          Text('Selected',
                              style: TextStyles().w400_s16),
                          Spacer(),
                          Text('${widget.piece}',
                              style: TextStyles().w400_s16)
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: double.maxFinite,
                        height: 1,
                        color: Colors.grey[300],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text('Subtotal',
                              style: TextStyles().w400_s16),
                          Spacer(),
                          Text('₺${subtotal}',
                              style: TextStyles().w400_s16)
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: double.maxFinite,
                        height: 1,
                        color: Colors.grey[300],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text('Discount',
                              style: TextStyles().w400_s16),
                          Spacer(),
                          Text('₺${discount}',
                              style: TextStyles().w400_s16)
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: double.maxFinite,
                        height: 1,
                        color: Colors.grey[300],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text('Delivery',
                              style: TextStyles().w400_s16),
                          Spacer(),
                          Text('₺${delivery}',
                              style: TextStyles().w400_s16)
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: double.maxFinite,
                        height: 1,
                        color: Colors.grey[300],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text('Total',
                              style: TextStyles().w600_s18),
                          Spacer(),
                          Text('₺${total}',
                              style: TextStyles().w600_s18)
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              Spacer(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Processing()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: CustomColors().customDarkGreen,
                      minimumSize: Size(double.maxFinite, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: Text('Pay now',
                      style: TextStyles().white_w400_s18))
            ],
          ),
        ));
  }
}
