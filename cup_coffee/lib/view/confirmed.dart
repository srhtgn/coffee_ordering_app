import 'package:cup_coffee/constant/images.dart';
import 'package:cup_coffee/constant/text_styles.dart';
import 'package:cup_coffee/view/home.dart';
import 'package:flutter/material.dart';

class Confirmed extends StatefulWidget {
  const Confirmed({Key? key}) : super(key: key);

  @override
  State<Confirmed> createState() => _ConfirmedState();
}

class _ConfirmedState extends State<Confirmed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(image: ImageItems().confirmedGif),
          ),
          Text('Order Confirmed!',
              style: TextStyles().black_w600_s24),
          InkWell( //işlem tamamlandığında ana ekrana dönmek için gerekli buton
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Home()));
            },
            child: Text('back to the homepage',
                style: TextStyles().customOrange_w500_s14),
          )

        ],
      ),
    );
  }
}
