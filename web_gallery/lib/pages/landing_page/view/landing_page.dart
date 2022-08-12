import 'package:flutter/material.dart';
import 'package:get/get.dart';

//
import 'package:web_gallery/pages/landing_page/controller/landing_page_controller.dart';
//
import 'package:web_gallery/pages/landing_page/components/photo.dart';

// full image viw page
import 'package:web_gallery/pages/full_image_view_page/view/full_image_view_page.dart';


class LandingPage extends StatelessWidget {
  final landingPageController = Get.find<LandingPageController>();

  LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;


    return WillPopScope(
      onWillPop: () async {
        bool willLeave = false;
        // show the confirm dialog
        await showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Are you sure want to leave?'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  willLeave = true;
                  Navigator.of(context).pop();
                },
                child: const Text('Yes'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('No'),
              ),
            ],
          ),
        );
        return willLeave;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Gallery',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          backgroundColor: Colors.white,
        ),

        body: Obx(() {
          return GridView.builder(
            controller: landingPageController.scrollController,
            // physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: landingPageController.imageList.length+1,
            itemBuilder: (BuildContext context, int index) {
              if(index<landingPageController.imageList.length) {
                return ImageCardItem(
                  imageUrl: landingPageController.imageList[index].imageUrlSmall,
                  action: () {
                    print("ok");
                    Get.toNamed('/fullImageViewPage', arguments: [landingPageController.imageList[index].imageUrlSmall,],);
                    // Get.toNamed('/fullImageViewPage', arguments: [landingPageController.imageList[index].imageUrlRegular,],);
                    // Get.toNamed('/fullImageViewPage', arguments: [landingPageController.imageList[index].imageUrlFull,],);
                    // Get.to(FullImageViewPage());
                  },
                );

              }
              else {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                  child: Container(
                    // color: Colors.yellow,
                    // width: screenWidth*.1,
                    height: 100,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }
            },
          );
        }),





      ),
    );
  }


}



class ImageCardItem extends StatelessWidget {
  String imageUrl;
  dynamic action;

  ImageCardItem({Key? key,
    required this.imageUrl,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          // color: Color.fromRGBO(137, 8, 252, .4),
          color: Colors.grey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: const Color.fromRGBO(243, 237, 255, 1),
      child: Material(
        color: Colors.transparent,
        child: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     // image: AssetImage('assets/images/web_gallery.jpg'),
          //     image: AssetImage('assets/images/web_gallery.jpg'),
          //     fit: BoxFit.fill,
          //   ),
          //   shape: BoxShape.circle,
          // ),

          decoration: BoxDecoration(
            image: DecorationImage(
              // image: AssetImage('assets/images/web_gallery.jpg'),
              image: NetworkImage(imageUrl),
              fit: BoxFit.fill,
            ),
            // shape: BoxShape.circle,
          ),

          child: InkWell(
            borderRadius: BorderRadius.circular(5.0),
            // splashColor: const Color.fromRGBO(137, 8, 252, .1),
            // splashColor: Colors.grey,
            onTap: action,
          ),

        ),
      ),
    );




  }


}

