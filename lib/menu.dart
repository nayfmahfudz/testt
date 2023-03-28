import 'package:flutter/material.dart';
import 'package:testt/component/fom.dart';
import 'package:testt/setting.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: catatan(context),
      // bottomNavigationBar: bottomNavBar(context),
    );
  }
}

Widget catatan(context) {
  return Container(
    height: tinggi(context) * 0.45,
    decoration: BoxDecoration(
      color: biru,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35.0),
          bottomRight: Radius.circular(35.0)),
      // shadowColor: Color.fromRGBO(237, 155, 12, 1),
    ),
    child: Row(children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: lebar(context) * 0.15,
                  width: lebar(context) * 0.15,
                  color: putih,
                )
              ],
            ),
          ),
        ),
      ),
      Expanded(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person, color: putih, size: tinggi(context) * 0.04),
              Text(
                "Setting",
                style: TextStyle(color: putih),
              )
            ],
          ),
        ),
      )
    ]),
  );
}

Widget bottomNavBar(context) {
  return Container(
    height: tinggi(context) * 0.1,
    decoration: BoxDecoration(
      color: biru,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0)),
      // shadowColor: Color.fromRGBO(237, 155, 12, 1),
    ),
    child: Row(children: [
      Expanded(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home, color: putih, size: tinggi(context) * 0.04),
              Text(
                "Menu",
                style: TextStyle(color: putih),
              )
            ],
          ),
        ),
      ),
      Expanded(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person, color: putih, size: tinggi(context) * 0.04),
              Text(
                "Setting",
                style: TextStyle(color: putih),
              )
            ],
          ),
        ),
      )
    ]),
  );
}
