import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:testt/Login.dart';
import 'package:testt/component/api.dart';
import 'package:testt/menu.dart';
import 'package:testt/setting.dart';
import 'package:testt/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await initializeService();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp();
// service.startService();
  @override
  State<MyApp> createState() => _MyAppState();
}

@override
class _MyAppState extends State<MyApp> {
  initState() {
    super.initState();
  }

  bool main = false;
  Future splashscreen() async {
    absen["masuk"] = "";
    absen["keluar"] = "";
    return await Future.delayed(Duration(seconds: 6), () async {
      final prefs = await SharedPreferences.getInstance();
      print(prefs.getString("user"));
      key = prefs.getString("key") ?? "";
      user =
          prefs.getString("user") == null || prefs.getString("user") == "null"
              ? {}
              : jsonDecode(prefs.getString("user") ?? "");
      await cekAbsen(context);
      await cekKunjungan(context);
      if (key == null || key == "" && user == null || user.length == 0) {
        main = false;
      } else {
        main = true;
      }
      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sales Online',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          future: splashscreen(),
          builder: ((context, snapshot) {
            if (snapshot.data == true) {
              if (main) {
                return Menu();
              } else {
                return Login();
              }
            } else {
              return SplashScreen();
            }
          }),
        ));
  }
}
