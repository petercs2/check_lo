import 'package:get/get.dart';

import 'check_tab_logic.dart';

class CheckTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      CheckTabLogic(),
      permanent: true,
    );
  }
}
