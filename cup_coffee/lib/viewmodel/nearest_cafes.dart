import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cup_coffee/constant/colors.dart';
import 'package:cup_coffee/constant/text_styles.dart';
import 'package:cup_coffee/service/cafe_info_service.dart';
import 'package:cup_coffee/view/nearby_cafes.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class NearestCafes extends StatefulWidget {
  const NearestCafes({Key? key}) : super(key: key);


  @override
  State<NearestCafes> createState() => _NearestCafesState();
}

class _NearestCafesState extends State<NearestCafes> {
  CafeInfoService _dataService = CafeInfoService();
  late List<DocumentSnapshot> listOfDocumentSnap;

  late double lat;
  late double long;

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled(); //Kullanıcının anlık konumunu ve konum izinlerini almak
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions asre denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanetly denied, we cannot request');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: StreamBuilder(
            stream: _dataService.getCafeInfo(),
            builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
              if (asyncSnapshot.hasError) {
                return Center(child: Text('Bir hata oluştu tekrar deneyiniz'));
              }
              if (asyncSnapshot.connectionState == ConnectionState.waiting) {
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
                      var _name = listOfDocumentSnap[index]['name']; //Kafe bilgileri
                      var _rating = listOfDocumentSnap[index]['rating'];
                      var _image = listOfDocumentSnap[index]['image'];
                      var _location = listOfDocumentSnap[index]['location'];

                      NetworkImage image = NetworkImage(_image);

                      getCurrentLocation().then((value) {
                        lat = value.latitude;
                        long = value.longitude;
                      });

                      double distanceMeter = 0;
                      double distance = 0;
                      var state;

                      Geolocator.getCurrentPosition( //konum ayarları
                          desiredAccuracy: LocationAccuracy.high);
                      double storelat = _location[0]; //Kafelerin konum bilgilerini almak
                      double storelng = _location[1];

                      distanceMeter = Geolocator.distanceBetween(
                        lat,
                        long,
                        storelat,
                        storelng,
                      );
                      var _distance = distanceMeter.round();
                      distance = (_distance / 1000);

                      if (distance <= 5) { //Kafelerin kullanıcıya uzaklığı 5km ve daha altındaysa yakın kafeler bölümünde göster
                        state = InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NearbyCafes(
                                        name: _name,
                                        rating: _rating,
                                        image: _image,
                                        lat: _location[0],
                                        long: _location[1],
                                    )));
                          },
                          child: Card(
                            color: Colors.transparent,
                            elevation: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Stack(
                                      children: [
                                        Image(
                                          image: image,
                                          width: 175,
                                          height: 155,
                                          fit: BoxFit.cover,
                                        ),
                                        Positioned(
                                            top: 5,
                                            right: 5,
                                            child: Row(
                                              children: [
                                                Icon(Icons.location_on_outlined,
                                                    color: Colors.white),
                                                Text('${distance} km',
                                                    style: TextStyles().white_w600_s14)
                                              ],
                                            ))
                                      ],
                                    )),
                                Text('${_name}',
                                    style: TextStyles().black_w600_s16),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow),
                                    Text('${_rating} ratings',
                                        style: TextStyles().grey_w500_s10),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }
                      else if(distance > 5){//Kafelerin kullanıcıya uzaklığı 5km üstündeyse boş Container döndür
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
          ),
    );
  }
}
