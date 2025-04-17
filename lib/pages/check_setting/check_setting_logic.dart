import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckSettingLogic extends GetxController {

  var player1Type = 11;
  var player2Type = 5;

  aboutCheckUS(BuildContext context) async {
    var info = await PackageInfo.fromPlatform();
    showAboutDialog(
      applicationName: info.appName,
      applicationVersion: info.version,
      applicationIcon: Image.asset(
        'assets/launcher.webp',
        width: 76,
        height: 76,
      ),
      children: [
        const Text(
            """We can provide you with clock displays in different colors"""),
      ],
      context: context,
    );
  }


  @override
  void onInit() async {
    // TODO: implement onInit
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    player1Type = prefs.getInt('player1') ?? 11;
    player2Type = prefs.getInt('player2') ?? 5;
    update();
    super.onInit();
  }

}
