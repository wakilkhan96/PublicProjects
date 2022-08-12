import 'package:get/get.dart';
import 'package:web_gallery/pages/full_image_view_page/controller/full_image_view_page_controller.dart';


class FullImageViewPageBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(FullImageViewPageController());
  }

}