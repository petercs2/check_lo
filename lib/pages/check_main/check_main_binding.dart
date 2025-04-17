import 'package:get/get.dart';

import 'check_main_logic.dart';

class CheckMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckMainLogic());
  }
}
