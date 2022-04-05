import 'package:get/get.dart';
import 'package:getx_3_method/controller/create_controller.dart';
import 'package:getx_3_method/controller/edit_controller.dart';
import 'package:getx_3_method/controller/home_controller.dart';


class DIService {
  static Future<void> init() async {
    //Get.put<PaymentController>(PaymentController());
    Get.lazyPut<CreateController>(() => CreateController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<EditController>(() => EditController(), fenix: true);
  }
}