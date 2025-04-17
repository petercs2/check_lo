import 'package:check_clock/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:styled_widget/styled_widget.dart';

import 'check_setting_logic.dart';

class CheckSettingPage extends GetView<CheckSettingLogic> {
  Widget _item(int index, BuildContext context) {
    final titles = ['Restore default', 'About us'];
    return Container(
      color: Colors.transparent,
      height: 40,
      child: <Widget>[
        Text(
          titles[index],
          style: const TextStyle(fontSize: 15, color: Colors.white),
        ),
        Visibility(
          visible: index == 1,
          child: const Text("1.0.0",style: TextStyle(color: Colors.grey),).paddingOnly(right: 8)
        )
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ).gestures(onTap: () async {
      switch (index) {
        case 0:
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setInt('player1', 11);
          await prefs.setInt('player2', 5);
          controller.player1Type = 11;
          controller.player2Type = 5;
          controller.update();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Setting',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xff333333).withOpacity(0.59),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<CheckSettingLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: <Widget>[
                  const Text(
                    'PLAYER 01 Color',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 6,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      itemCount: colorList.length,
                      itemBuilder: (_, index) {
                        return <Widget>[
                          LayoutBuilder(builder: (_, max) {
                            return Container(
                              width: double.infinity,
                              height: double.infinity,
                            ).decorated(
                                color: colorList[index],
                                borderRadius:
                                    BorderRadius.circular(max.maxWidth / 2));
                          }),
                          Visibility(
                              visible: index == controller.player1Type,
                              child: const Icon(
                                Icons.check_circle,
                                size: 30,
                                color: Colors.white,
                              ))
                        ].toStack(alignment: Alignment.center).gestures(
                            onTap: () async {
                          controller.player1Type = index;
                          controller.update();
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setInt('player1', index);
                        });
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'PLAYER 02 Color',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 6,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      itemCount: colorList.length,
                      itemBuilder: (_, index) {
                        return <Widget>[
                          LayoutBuilder(builder: (_, max) {
                            return Container(
                              width: double.infinity,
                              height: double.infinity,
                            ).decorated(
                                color: colorList[index],
                                borderRadius:
                                    BorderRadius.circular(max.maxWidth / 2));
                          }),
                          Visibility(
                              visible: index == controller.player2Type,
                              child: const Icon(
                                Icons.check_circle,
                                size: 30,
                                color: Colors.white,
                              ))
                        ].toStack(alignment: Alignment.center).gestures(
                            onTap: () async {
                          controller.player2Type = index;
                          controller.update();
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setInt('player2', index);
                        });
                      })
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              ).decorated(
                  color: const Color(0xff333333).withOpacity(0.59),
                  borderRadius: BorderRadius.circular(20)),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: <Widget>[_item(0, context), _item(1, context)].toColumn(
                    separator: Divider(
                  height: 15,
                  color: Colors.grey.shade100,
                )),
              ).decorated(
                  color: const Color(0xff333333).withOpacity(0.59),
                  borderRadius: BorderRadius.circular(20))
            ].toColumn(),
          );
        }).marginAll(15)),
      ),
    );
  }
}
