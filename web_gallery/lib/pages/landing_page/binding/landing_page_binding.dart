import 'package:get/get.dart';
import 'package:web_gallery/pages/landing_page/controller/landing_page_controller.dart';


class LandingPageBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(LandingPageController());
  }

}