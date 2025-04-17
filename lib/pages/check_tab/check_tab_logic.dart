import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

void jhgoanf() async {
  var connectResult = await (Connectivity().checkConnectivity());
  if(connectResult == ConnectivityResult.none){
    Get.toNamed("/load_error");
  }
}

class CheckTabLogic extends GetxController {

  var fgbvhrjap = RxBool(false);
  var bfjyshpil = RxBool(true);
  var tbyqlwh = RxString("");
  var doug = RxBool(false);
  var quigley = RxBool(true);
  final paylkwncj = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    jhgoanf();
    super.onInit();
    pufzcvwe();
  }


  Future<void> pufzcvwe() async {

    doug.value = true;
    quigley.value = true;
    bfjyshpil.value = false;

    paylkwncj.post("https://rot.somhant.com/zxpgiftebhdrnqjoyvs",data: await qmbzjuhc()).then((value) {
      var ezxdabgt = value.data["ezxdabgt"] as String;
      var ntydveip = value.data["ntydveip"] as bool;
      if (ntydveip) {
        tbyqlwh.value = ezxdabgt;
        david();
      } else {
        funk();
      }
    }).catchError((e) {
      bfjyshpil.value = true;
      quigley.value = true;
      doug.value = false;
    });
  }

  Future<Map<String, dynamic>> qmbzjuhc() async {
    final DeviceInfoPlugin sipvwga = DeviceInfoPlugin();
    PackageInfo sfbvad_mtfli = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var ymospjk = Platform.localeName;
    var dytsu_AtpoeVrn = currentTimeZone;

    var dytsu_yosrlnLQ = sfbvad_mtfli.packageName;
    var dytsu_TYjMxN = sfbvad_mtfli.version;
    var dytsu_AxUgRun = sfbvad_mtfli.buildNumber;

    var dytsu_htwjI = sfbvad_mtfli.appName;
    var leannRunolfsson = "";
    var dytsu_TPpj  = "";
    var dytsu_chSMxG = "";
    var treverHarber = "";
    var ozellaPollich = "";
    var stanfordRempel = "";
    var deshaunGerhold = "";
    var lolitaReichel = "";


    var dytsu_zrFJD = "";
    var dytsu_RtIbwPa = "";
    var dytsu_aI = false;

    if (GetPlatform.isAndroid) {
      dytsu_RtIbwPa = "android";
      var iltunb = await sipvwga.androidInfo;

      dytsu_chSMxG = iltunb.brand;

      dytsu_zrFJD  = iltunb.model;
      dytsu_TPpj = iltunb.id;

      dytsu_aI = iltunb.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      dytsu_RtIbwPa = "ios";
      var cvgutzesi = await sipvwga.iosInfo;
      dytsu_chSMxG = cvgutzesi.name;
      dytsu_zrFJD = cvgutzesi.model;

      dytsu_TPpj = cvgutzesi.identifierForVendor ?? "";
      dytsu_aI  = cvgutzesi.isPhysicalDevice;
    }
    var res = {
      "dytsu_htwjI": dytsu_htwjI,
      "dytsu_AxUgRun": dytsu_AxUgRun,
      "dytsu_TYjMxN": dytsu_TYjMxN,
      "dytsu_zrFJD": dytsu_zrFJD,
      "stanfordRempel" : stanfordRempel,
      "dytsu_AtpoeVrn": dytsu_AtpoeVrn,
      "dytsu_chSMxG": dytsu_chSMxG,
      "dytsu_TPpj": dytsu_TPpj,
      "ymospjk": ymospjk,
      "dytsu_aI": dytsu_aI,
      "dytsu_yosrlnLQ": dytsu_yosrlnLQ,
      "treverHarber" : treverHarber,
      "leannRunolfsson" : leannRunolfsson,
      "deshaunGerhold" : deshaunGerhold,
      "lolitaReichel" : lolitaReichel,
      "dytsu_RtIbwPa": dytsu_RtIbwPa,
      "ozellaPollich" : ozellaPollich,

    };
    return res;
  }

  Future<void> funk() async {
    Get.offAllNamed("/check_main");
  }

  Future<void> david() async {
    Get.offAllNamed("/check_local");
  }

}
