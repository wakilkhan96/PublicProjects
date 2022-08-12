import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    delay();
  }

  Future<void> delay() async {
    Timer(
      const Duration(milliseconds: 1700),
      () => {
        Get.offAllNamed("/landingPage"),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: screenWidth*1,
            height: 250,
            decoration: const BoxDecoration(
              // color: Colors.yellow,
              image: DecorationImage(
                image: AssetImage('assets/images/web_gallery.jpg'),
                fit: BoxFit.fitHeight,
              ),
              shape: BoxShape.rectangle,
            ),

          ),
          const SizedBox(height: 20,),

        ],
      ),
    );


  }
}
