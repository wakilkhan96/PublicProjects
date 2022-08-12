import 'package:flutter/material.dart';
import 'package:get/get.dart';

//
import 'package:web_gallery/services/unsplash_image_api_service.dart';
//
import 'package:web_gallery/pages/landing_page/components/photo.dart';


class LandingPageController extends GetxController{
  late ScrollController scrollController;

  late int pageToLoad;

  // List<String> imageList= [
  //   'https://picsum.photos/200/300',
  //   'https://picsum.photos/200/300',
  //   'https://picsum.photos/200/300',
  //   'https://picsum.photos/200/300',
  //   'https://picsum.photos/200/300',
  //   'https://picsum.photos/200/300',
  //   'https://picsum.photos/200/300',
  //   'https://picsum.photos/200/300',
  //   'https://picsum.photos/200/300',
  //   'https://picsum.photos/200/300',
  //   'https://picsum.photos/200/300',
  //   'https://picsum.photos/200/300',
  //   'https://picsum.photos/200/300',
  //   'https://picsum.photos/200/300',
  //   'https://picsum.photos/200/300',
  // ].obs;

  var imageList= <Photo>[].obs;




  @override
  void onInit() {
    super.onInit();
    pageToLoad = 1;

    // for(int i=0; i<15; i++) {
    //   imageList.add(
    //       const Photo(imageUrl: 'https://picsum.photos/200/300',)
    //   );
    // }

    getImagesDataFromAPI();

    scrollController = ScrollController();
    scrollController.addListener(() async {
      if(scrollController.offset >= scrollController.position.maxScrollExtent) {
        print('bottom');
        getImagesDataFromAPI();
      }
    });
  }

  void getImagesDataFromAPI() async {
    String accessKey = "xv4eTVX23aN8eWKxoYoJsO4IBPtUDTAkV29FYwOPjJo";
    String secretKey = '3Kb8BT0lMLLfbEj6O_N9rqpfkSSNzRhsQ_YnANx0pkA';

    String apiUrl = "https://api.unsplash.com/photos?page=$pageToLoad&client_id=$accessKey";
    UnsplashImageAPIService ob = UnsplashImageAPIService();
    // ob.getData();
    List<Photo> dataList = await ob.getAPIImageData(apiUrl);

    if(dataList.isNotEmpty) pageToLoad++;

    fetchData(dataList);
  }

  void fetchData(List<Photo> dataList) async {
    // await Future.delayed(const Duration(milliseconds: 400),);
    for(Photo data in dataList) {
      imageList.add(data);
    }
  }



}