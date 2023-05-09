import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();

    await 5.delay();
    Get.offNamed('/login');
  }

  @override
  void onClose() {
    super.onClose();
  }
}
