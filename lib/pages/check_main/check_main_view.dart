import 'package:check_clock/main.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'dart:math' as math;
import 'check_main_logic.dart';

class CheckMainPage extends StatefulWidget {
  const CheckMainPage({Key? key}) : super(key: key);

  @override
  State<CheckMainPage> createState() => _CheckMainPageState();
}

class _CheckMainPageState extends State<CheckMainPage> {
  CheckMainLogic controller = Get.find();

  bool isLandscape = false;

  void changeOrientation() async {
    if (isLandscape) {
      isLandscape = false;
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    } else {
      isLandscape = true;
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
    controller.update();
  }

  Widget portraitWidget() {
    return <Widget>[
      Expanded(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          child: <Widget>[
            Transform(
              transform: Matrix4.identity()..rotateZ(math.pi),
              alignment: Alignment.center,
              child: <Widget>[
                Obx(() {
                  return Text(
                    controller.ymdStr.value,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  );
                }),
                Obx(() {
                  return Text(
                    controller.secondStr.value,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 54,
                        fontWeight: FontWeight.bold),
                  );
                }),
                Obx(() {
                  return Text(
                    controller.weekStr.value,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  );
                }),
              ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
            ),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..rotateZ(math.pi),
              child: Obx(() {
                return Text(
                  controller.hmStr.value,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 80,
                      fontWeight: FontWeight.bold),
                );
              }),
            ),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..rotateZ(math.pi),
              child: const Text(
                'PLAYER 02',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ].toColumn(mainAxisAlignment: MainAxisAlignment.center),
        ).decorated(
            color: colorList[controller.player2Type],
            borderRadius: BorderRadius.circular(29)),
      ),
      <Widget>[
        const Icon(
          Icons.settings,
          size: 39,
          color: Colors.white,
        ).gestures(onTap: () {
          Get.toNamed('/check_setting')?.then((_) {
            controller.onRefresh();
          });
        }),
        const SizedBox(
          width: 50,
        ),
        const Icon(
          Icons.refresh,
          size: 39,
          color: Colors.white,
        ).gestures(onTap: () {
          changeOrientation();
        }),
      ]
          .toRow(mainAxisAlignment: MainAxisAlignment.center)
          .marginSymmetric(vertical: 30),
      Expanded(
          child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: <Widget>[
          const Text(
            'PLAYER 01',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Obx(() {
            return Text(
              controller.hmStr.value,
              style:
                  const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
            );
          }),
          <Widget>[
            Obx(() {
              return Text(
                controller.ymdStr.value,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              );
            }),
            Obx(() {
              return Text(
                controller.secondStr.value,
                style:
                    const TextStyle(fontSize: 54, fontWeight: FontWeight.bold),
              );
            }),
            Obx(() {
              return Text(
                controller.weekStr.value,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              );
            }),
          ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween)
        ].toColumn(mainAxisAlignment: MainAxisAlignment.center),
      ).decorated(
              color: colorList[controller.player1Type],
              borderRadius: BorderRadius.circular(29)))
    ].toColumn().marginAll(15);
  }

  Widget landscapeWidget() {
    return <Widget>[
      <Widget>[
        const Icon(
          Icons.settings,
          size: 39,
          color: Colors.white,
        ).gestures(onTap: () {
          Get.toNamed('/check_setting')?.then((_) {
            controller.onRefresh();
          });
        }),
        const SizedBox(
          width: 50,
        ),
        const Icon(
          Icons.refresh,
          size: 39,
          color: Colors.white,
        ).gestures(onTap: () {
          changeOrientation();
        }),
      ].toRow(mainAxisAlignment: MainAxisAlignment.center),
      const SizedBox(
        height: 30,
      ),
      <Widget>[
        Expanded(
            child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          child: <Widget>[
            const Text(
              'PLAYER 02',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Obx(() {
              return Text(
                controller.hmStr.value,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 80,
                    fontWeight: FontWeight.bold),
              );
            }),
            <Widget>[
              Obx(() {
                return Text(
                  controller.ymdStr.value,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                );
              }),
              Obx(() {
                return Text(
                  controller.secondStr.value,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 54,
                      fontWeight: FontWeight.bold),
                );
              }),
              Obx(() {
                return Text(
                  controller.weekStr.value,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                );
              }),
            ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween)
          ].toColumn(mainAxisAlignment: MainAxisAlignment.center),
        ).decorated(
                color: colorList[controller.player2Type],
                borderRadius: BorderRadius.circular(29))),
        const SizedBox(
          width: 30,
        ),
        Expanded(
            child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          child: <Widget>[
            const Text(
              'PLAYER 01',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Obx(() {
              return Text(
                controller.hmStr.value,
                style:
                    const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
              );
            }),
            <Widget>[
              Obx(() {
                return Text(
                  controller.ymdStr.value,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                );
              }),
              Obx(() {
                return Text(
                  controller.secondStr.value,
                  style: const TextStyle(
                      fontSize: 54, fontWeight: FontWeight.bold),
                );
              }),
              Obx(() {
                return Text(
                  controller.weekStr.value,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                );
              }),
            ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween)
          ].toColumn(mainAxisAlignment: MainAxisAlignment.center),
        ).decorated(
                color: colorList[controller.player1Type],
                borderRadius: BorderRadius.circular(29)))
      ].toRow()
    ].toColumn();
  }

  void checkNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      Get.toNamed('/load_error');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    checkNetwork();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<CheckMainLogic>(builder: (_) {
          return isLandscape ? landscapeWidget() : portraitWidget();
        }),
      ),
    );
  }
}
