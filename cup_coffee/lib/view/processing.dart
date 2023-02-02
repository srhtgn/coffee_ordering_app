import 'dart:async';
import 'package:cup_coffee/constant/images.dart';
import 'package:cup_coffee/constant/text_styles.dart';
import 'package:cup_coffee/view/confirmed.dart';
import 'package:flutter/material.dart';

class Processing extends StatefulWidget {
  const Processing({Key? key}) : super(key: key);

  @override
  State<Processing> createState() => _ProcessingState();
}

class _ProcessingState extends State<Processing> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async { //2 saniye bu sayfada bekle
    var duration = Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {//2 saniye sonra Confirmed sayfasına git
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Confirmed()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(image: ImageItems().processingGif),
          ),
          Text('Your order is processing',style: TextStyles().black_w600_s24)
        ],
      ),
    );
  }
}
