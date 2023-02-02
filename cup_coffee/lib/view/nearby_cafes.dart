import 'dart:ui';
import 'package:cup_coffee/constant/colors.dart';
import 'package:cup_coffee/constant/images.dart';
import 'package:cup_coffee/constant/text_styles.dart';
import 'package:cup_coffee/view/reserve.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//Yorum satırı ekle!!!!!!!
class NearbyCafes extends StatefulWidget {
  // const NearbyCafes({Key? key}) : super(key: key);

  String name;
  double rating;
  String image;
  double lat;
  double long;

  NearbyCafes({
    required this.name,
    required this.rating,
    required this.image,
    required this.lat,
    required this.long,
  });

  @override
  State<NearbyCafes> createState() => _NearbyCafesState();
}

class _NearbyCafesState extends State<NearbyCafes> {
  late GoogleMapController googleMapController;

  Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: Text('Nearby shops',
            style: TextStyles().w500_s18),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 35, right: 8, left: 8),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image(
                        image: NetworkImage(widget.image),
                        width: double.maxFinite,
                        height: 330,
                        fit: BoxFit.cover),
                  ),
                  Positioned(
                      right: 60,
                      left: 60,
                      bottom: 15,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaY: 20.0, sigmaX: 20.0),
                            child: Container(
                              width: double.maxFinite,
                              height: 60,
                              child: Row(
                                children: [
                                  Spacer(),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image(
                                      image: ImageItems().asleyCafeImage,
                                      fit: BoxFit.cover,
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                  Spacer(),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image(
                                        image: ImageItems().coffeeCafeImage,
                                        fit: BoxFit.cover,
                                        height: 50,
                                        width: 50),
                                  ),
                                  Spacer(),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image(
                                      image: ImageItems().bunnyCafeImage,
                                      fit: BoxFit.cover,
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                  Spacer(),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image(
                                      image: ImageItems().oldTownCafeImage,
                                      fit: BoxFit.cover,
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          )))
                ],
              )),
          Padding(
              padding: EdgeInsets.only(top: 10, right: 30, left: 30),
              child: Container(
                height: 383,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('${widget.name}',
                            style: TextStyles().black_w600_s24),
                        Spacer(),
                        Icon(Icons.star, color: Colors.yellow),
                        Text('${widget.rating}',
                            style: TextStyles().grey_w500_s14)
                      ],
                    ),
                    Text('Special coffee and cakes',
                        style: TextStyles().black_w400_s14),
                    Spacer(),
                    Container(
                        width: double.maxFinite,
                        height: 250,
                        child: Stack(
                          children: [
                            GoogleMap( //Yakındaki seçilen kafenin harita üzerinde gösterilmesi
                              markers: markers,
                              zoomControlsEnabled: false,
                              mapType: MapType.normal,
                              onMapCreated: (GoogleMapController controller) {
                                googleMapController.animateCamera(
                                    CameraUpdate.newCameraPosition(
                                        CameraPosition(
                                            target:
                                                LatLng(widget.lat, widget.long),
                                            zoom: 14)));
                                markers.clear();
                                markers.add(Marker(
                                    markerId: MarkerId('${widget.name}'),
                                    position: LatLng(widget.lat, widget.long)));
                                setState(() {});
                              },
                              initialCameraPosition: CameraPosition(
                                  target: LatLng(widget.lat, widget.long),
                                  zoom: 14),
                            ),
                            Positioned(
                                right: 0,
                                left: 0,
                                top: 0,
                                bottom: 0,
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                ))
                          ],
                        )),
                    Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Reserve(name: widget.name)));
                        },
                        style: ElevatedButton.styleFrom(
                            primary: CustomColors().customDarkGreen,
                            minimumSize: Size(double.maxFinite, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        child: Text('View products',
                            style: TextStyles().white_w600_s18)),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
