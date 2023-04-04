import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:testt/Login.dart';
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

  Future splashscreen() async {
    return await Future.delayed(Duration(seconds: 6), () {
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
              return Login();
            } else {
              return SplashScreen();
            }
          }),
        ));
  }
}
