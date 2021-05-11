import 'dart:developer';

import 'package:appgain_task/others/fcm.dart';
import 'package:appgain_task/view/home.dart';
import 'package:appgain_task/view/movie_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  List result;
  static const platform = const MethodChannel('com.appgain');
  Future<void> getData() async {
    try {
      result = await platform.invokeMethod('getData');
      if (result.isNotEmpty) {
        Get.offAll(() => MovieDetails(
              movieID: result[0].toString(),
            ));
        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //         builder: (ctx) => MovieDetails(
        //               movieID: result[0].toString(),
        //               title: "",
        //             )));
      } else {
        Get.offAll(() => Home());
      }
      log("PlatformChannelResponse:------------ $result");
    } on Exception catch (e) {
      log('ErrorPlatformChannel:$e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handleFcm();

    getData().whenComplete(() {
      if (result == null) {
        Future.delayed(Duration(seconds: 2), () => Get.offAll(() => Home()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'APP',
            style: TextStyle(
                fontSize: 22,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'GAIN.io',
            style: TextStyle(
                fontSize: 22, color: Colors.red, fontWeight: FontWeight.bold),
          )
        ],
      ),
    ));
  }
}
