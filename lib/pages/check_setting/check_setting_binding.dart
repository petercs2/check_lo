import 'package:get/get.dart';

import 'check_setting_logic.dart';

class CheckSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckSettingLogic());
  }
}
