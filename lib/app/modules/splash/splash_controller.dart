import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();

    await 1.delay();
    Get.offNamed('/home');
  }

  @override
  void onClose() {
    super.onClose();
  }
}
