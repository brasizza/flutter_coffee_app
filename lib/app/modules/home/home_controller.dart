import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/config/base_config.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  //TODO: Implement HomeController.

  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 6);
    final env = Get.find<Env>();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
