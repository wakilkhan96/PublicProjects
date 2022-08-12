import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:web_gallery/pages/landing_page/components/photo.dart';



class UnsplashImageAPIService {

  Future<List<Photo>> getAPIImageData(String url) async {
    var response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      print("Request Successful");
      var decodedJson = convert.jsonDecode(response.body);

      // List<String> urlOfImages = [];
      // for(var item in decodedJson) {
      //   // print(item['urls']['full']);
      //   // 'full' 'regular' 'small'
      //   urlOfImages.add(item['urls']['regular']);
      // }
      //
      // return urlOfImages;


      List<Photo> imageList = [];
      for(var item in decodedJson) {
        // print(item['urls']['full']);
        // 'full' 'regular' 'small'
        imageList.add(
          Photo(
            imageUrlSmall: item['urls']['small'],
            imageUrlRegular: item['urls']['regular'],
            imageUrlFull: item['urls']['full'],
          ),
        );
      }

      return imageList;
    }
    else {
      print('Request failed with status: ${response.statusCode}.');
      return <Photo>[];
    }
  }


}