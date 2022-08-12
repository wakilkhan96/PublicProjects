import 'package:flutter/material.dart';
import 'package:get/get.dart';


// // // pages imports

// splash screen page
import 'package:web_gallery/splash_screen.dart';

// landing page
import 'package:web_gallery/pages/landing_page/binding/landing_page_binding.dart';
import 'package:web_gallery/pages/landing_page/view/landing_page.dart';

// full image view page
import 'package:web_gallery/pages/full_image_view_page/binding/full_image_view_page_binding.dart';
import 'package:web_gallery/pages/full_image_view_page/view/full_image_view_page.dart';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Web Gallery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: [
        GetPage(name: "/splashScreen", page: ()=>const SplashScreen()),
        GetPage(name: '/landingPage', page: () => LandingPage(), binding: LandingPageBinding()),
        GetPage(name: '/fullImageViewPage', page: () => FullImageViewPage(), binding: FullImageViewPageBinding()),

      ],
      initialRoute: "/splashScreen",
    );
  }
}