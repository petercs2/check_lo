import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'check_tab_logic.dart';

class CheckTabView extends GetView<CheckTabLogic> {
  const CheckTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.steuber.value
              ? CircularProgressIndicator(color: Colors.blue[300])
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.hlkotsd();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
