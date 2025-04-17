import 'package:check_clock/pages/check_main/check_main_binding.dart';
import 'package:check_clock/pages/check_main/check_main_view.dart';
import 'package:check_clock/pages/check_setting/check_setting_binding.dart';
import 'package:check_clock/pages/check_setting/check_setting_view.dart';
import 'package:check_clock/pages/load_error/load_error_binding.dart';
import 'package:check_clock/pages/load_error/load_error_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color primaryColor = Colors.black;
Color bgColor = Colors.black;

List<Color> colorList = [
  const Color(0xffff0000),
  const Color(0xffff9300),
  const Color(0xffffd800),
  const Color(0xff0aff00),
  const Color(0xff00d8ff),
  const Color(0xff0045ff),
  const Color(0xffce00ff),
  const Color(0xff8b8b8b),
  const Color(0xff1ed595),
  const Color(0xff4c95b1),
  const Color(0xff9465de),
  const Color(0xffffc60a),
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final int? player1 = prefs.getInt('player1');
  if (player1 == null) {
    await prefs.setInt('player1', 11);
    await prefs.setInt('player2', 5);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Checks,
      initialRoute: '/check_main',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}

List<GetPage<dynamic>> Checks = [
  GetPage(name: '/check_main', page: () => const CheckMainPage(), binding: CheckMainBinding()),
  GetPage(name: '/check_setting', page: () => CheckSettingPage(), binding: CheckSettingBinding()),
  GetPage(name: '/load_error', page: () => const LoadErrorView(), binding: LoadErrorBinding()),
];
