import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cup_coffee/constant/colors.dart';
import 'package:cup_coffee/constant/text_styles.dart';
import 'package:cup_coffee/service/products_service.dart';
import 'package:cup_coffee/view/details.dart';
import 'package:flutter/material.dart';

class AsleyCafeReserves extends StatefulWidget {
  const AsleyCafeReserves({Key? key}) : super(key: key);

  @override
  State<AsleyCafeReserves> createState() => _AsleyCafeReservesState();
}

class _AsleyCafeReservesState extends State<AsleyCafeReserves> {
  ProductsService _cafeReserveService = ProductsService();

  late List<DocumentSnapshot> listOfDocumentSnap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: StreamBuilder(
          stream: _cafeReserveService.getAsleyCafeProductsInfo(),
          builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
            if (asyncSnapshot.hasError) {
              return Center(
                  child: Text('An error has occurred, try again!'));
            }
            if (asyncSnapshot.connectionState ==
                ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                      color: CustomColors().customDarkGreen));
            } else {
              if (asyncSnapshot.hasData) {
                listOfDocumentSnap = asyncSnapshot.data.docs;

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listOfDocumentSnap.length,
                  itemBuilder: (context, index) {
                    var _name = listOfDocumentSnap[index]['name']; //Kafe ürün bilgileri
                    var _price = listOfDocumentSnap[index]['price'];
                    var _rating = listOfDocumentSnap[index]['rating'];
                    var _image = listOfDocumentSnap[index]['image'];
                    var _time = listOfDocumentSnap[index]['time'];

                    NetworkImage image = NetworkImage(_image);

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(name: _name, rating: _rating, price: _price, image: _image, time: _time,)));
                      },
                      child: Row(
                        children: [
                          Card(
                            color: Colors.transparent,
                            elevation: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image(
                                    image: image,
                                    width: 250,
                                    height: 450,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text('${_name}',
                                    style: TextStyles().black_w600_s16),
                                Text('₺${_price}',
                                    style: TextStyles().grey_w500_s12),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      )
                    );
                  },
                );
              } else {
                return Center(
                    child: CircularProgressIndicator(
                        color: CustomColors().customDarkGreen));
              }
            }
          },
        ));
  }
}

class AsleyCafePopularProducts extends StatefulWidget {
  const AsleyCafePopularProducts({Key? key}) : super(key: key);

  @override
  State<AsleyCafePopularProducts> createState() => _AsleyCafePopularProductsState();
}

class _AsleyCafePopularProductsState extends State<AsleyCafePopularProducts> {
  ProductsService _cafeReserveService = ProductsService();

  late List<DocumentSnapshot> listOfDocumentSnap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: StreamBuilder(
          stream: _cafeReserveService.getAsleyCafeProductsInfo(),
          builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
            if (asyncSnapshot.hasError) {
              return Center(
                  child: Text('An error has occurred, try again!'));
            }
            if (asyncSnapshot.connectionState ==
                ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                      color: CustomColors().customDarkGreen));
            } else {
              if (asyncSnapshot.hasData) {
                listOfDocumentSnap = asyncSnapshot.data.docs;

                return ListView.builder(
                  itemCount: listOfDocumentSnap.length,
                  itemBuilder: (context, index) {
                    var _name = listOfDocumentSnap[index]['name']; //Kafe ürün bilgileri
                    var _price = listOfDocumentSnap[index]['price'];
                    var _rating = listOfDocumentSnap[index]['rating'];
                    var _image = listOfDocumentSnap[index]['image'];
                    var _time = listOfDocumentSnap[index]['time'];

                    NetworkImage image = NetworkImage(_image);

                    var state;

                    if(_rating > 4.8){ //Rating değeri 4.8 üzeinde olan ürünleri getir
                      state = InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Details(name: _name, rating: _rating, price: _price, image: _image, time: _time,)));
                        },
                        child:Card(
                                color: Colors.transparent,
                                elevation: 0,
                                child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Stack(
                                            children: [
                                              Image(
                                                image: image,
                                                width: 260,
                                                height: 180,
                                                fit: BoxFit.cover,
                                              ),
                                              Positioned(
                                                right: 10,
                                                  bottom: 5,
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.star, color: Colors.yellow),
                                                      Text('${_rating}',
                                                          style: TextStyles().white_w500_s14)
                                                    ],
                                                  )),
                                              Positioned(
                                                  left: 10,
                                                  bottom: 5,
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.access_time, color: Colors.white),
                                                      Text('${_time} min delivery',
                                                          style: TextStyles().white_w500_s14)
                                                    ],
                                                  )),
                                            ],
                                          )
                                        ),
                                        Container(
                                          width: 260,
                                          child: Row(
                                            children: [
                                              Text('${_name}',
                                                  style: TextStyles().black_w600_s18),
                                              Spacer(),
                                              Text('₺${_price}',
                                                  style: TextStyles().black_w600_s18),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.location_on_outlined, color: Colors.grey),
                                            Text('Asley Cafe',
                                                style: TextStyles().grey_w400_s14),
                                          ],
                                        )
                                      ],
                                    ),
                                ),

                      );
                    }else if(_rating <= 4.8){ //Rating değeri 4.8 değerinden büyük bir ürün yoksa boş bir Container döndür
                      state = Container();
                    }

                    return state;
                  },
                );
              } else {
                return Center(
                    child: CircularProgressIndicator(
                        color: CustomColors().customDarkGreen));
              }
            }
          },
        ));
  }
}