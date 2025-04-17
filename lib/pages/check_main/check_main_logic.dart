import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckMainLogic extends GetxController {

  Timer? _timer;

  var player1Type = 11;
  var player2Type = 5;


  var hmStr = '00:00'.obs;
  var secondStr = '00'.obs;
  var ymdStr = ''.obs;
  var weekStr = ''.obs;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        final now = DateTime.now();
        hmStr.value = DateFormat('HH:mm').format(now);
        secondStr.value = DateFormat('ss').format(now);
        ymdStr.value = DateFormat('MM/dd/yyyy').format(now);
        weekStr.value = DateFormat('EEE').format(now);
    });
  }

  void onRefresh() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    player1Type = prefs.getInt('player1') ?? 11;
    player2Type = prefs.getInt('player2') ?? 5;
    update();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    onRefresh();
    startTimer();
    super.onInit();
  }

}
