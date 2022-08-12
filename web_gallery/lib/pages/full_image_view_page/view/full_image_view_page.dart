import 'package:flutter/material.dart';
import 'package:get/get.dart';

//
import 'package:web_gallery/pages/full_image_view_page/controller/full_image_view_page_controller.dart';
//
// import 'package:web_gallery/pages/landing_page/components/photo.dart';

class FullImageViewPage extends StatelessWidget {
  final fullImageViewPageController = Get.find<FullImageViewPageController>();

  final data = Get.arguments;

  FullImageViewPage({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Center(
          // child: Text(
          //   data[0].toString(),
          // ),

          // fit: BoxFit.cover,

          child: InteractiveViewer(
            clipBehavior: Clip.none,
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRect(
                child: Image.network(
                  data[0],
                  // width: 40,
                  // height: 40,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return const Text('Internet Interruption');
                  },
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
