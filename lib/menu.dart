import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testt/Visit.dart';
import 'package:testt/component/fom.dart';
import 'package:testt/pendaftaran.dart';
import 'package:testt/setting.dart';

import 'component/api.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: abu,

      body: Row(
        children: [
          Expanded(flex: 1, child: appbar(context)),
          Expanded(
            flex: 3,
            child: Container(
              child: Column(
                children: [catatan(context), dashboard(context)],
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: bottomNavBar(context),
    );
  }
}

Widget appbar(context) {
  return Container(
    color: putih,
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Text("Sales Dashboard",
              style: GoogleFonts.montserrat(
                fontSize: 20,
                textStyle: Theme.of(context).textTheme.bodyLarge,
              )),
          SizedBox(
            height: tinggi(context) * 0.02,
          ),
          CircleAvatar(
            radius: 60,
            backgroundColor: orange,
            // backgroundImage: AssetImage('assets/horse.png'),
          ),
          SizedBox(
            height: tinggi(context) * 0.015,
          ),
          Text(user["nama"] ?? "",
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                textStyle: Theme.of(context).textTheme.bodyLarge,
              )),
          SizedBox(
            height: tinggi(context) * 0.015,
          ),
          Text(user["type"] ?? "",
              style: GoogleFonts.montserrat(
                fontSize: 20,
                textStyle: Theme.of(context).textTheme.bodyLarge,
              )),
          SizedBox(
            height: tinggi(context) * 0.015,
          ),
          Container(
              height: tinggi(context) * 0.07,
              child: Padding(
                padding: EdgeInsets.only(
                    left: lebar(context) * 0.04, right: lebar(context) * 0.04),
                child: loginButton('Berkunjung', hijau, putih),
              )),
          SizedBox(
            height: tinggi(context) * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                  absen["masuk"] == null
                      ? "Masuk :"
                      : "Masuk :" + absen["masuk"],
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                  )),
              Text(
                  absen["keluar"] == null
                      ? "Keluar :"
                      : "Keluar :" + absen["keluar"],
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                  )),
            ],
          ),
          SizedBox(
            height: tinggi(context) * 0.007,
          ),
          GestureDetector(
            onTap: (() {
              absen["keluar"] != "" ? null : attendance(context);
            }),
            child: Container(
                height: tinggi(context) * 0.07,
                child: loginButton(
                    absen["masuk"] == "" ? 'Absen Masuk' : 'Absen Keluar',
                    absen["keluar"] == "" ? biru : abu,
                    absen["keluar"] == "" ? putih : hitam)),
          ),
          SizedBox(
            height: tinggi(context) * 0.025,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text("Visit :",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                )),
          ),
          SizedBox(
            height: tinggi(context) * 0.015,
          ),
          Row(
            children: [
              Container(
                height: tinggi(context) * 0.08,
                width: tinggi(context) * 0.08,
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    //   BoxShadow(
                    //     color: biru.withOpacity(0.4),
                    //     blurRadius: 6,
                    //     offset: Offset(0, 8),
                    //   ),
                  ],
                  color: peach,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  // shadowColor: Color.fromRGBO(237, 155, 12, 1),
                ),
                child: Icon(Icons.store,
                    color: orange, size: tinggi(context) * 0.04),
              ),
              SizedBox(
                width: lebar(context) * 0.01,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Makmur Jaya",
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                      )),
                  Text("Surabaya",
                      style: GoogleFonts.montserrat(
                        fontSize: 8,
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                      )),
                ],
              ),
            ],
          ),
          SizedBox(
            height: tinggi(context) * 0.01,
          ),
          Row(
            children: [
              Container(
                height: tinggi(context) * 0.08,
                width: tinggi(context) * 0.08,
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[],
                  color: peach,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  // shadowColor: Color.fromRGBO(237, 155, 12, 1),
                ),
                child: Icon(Icons.account_box,
                    color: orange, size: tinggi(context) * 0.04),
              ),
              SizedBox(
                width: lebar(context) * 0.01,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sulistyo",
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                      )),
                  Text("0822253255555",
                      style: GoogleFonts.montserrat(
                        fontSize: 7,
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                      )),
                ],
              ),
            ],
          ),
          SizedBox(
            height: tinggi(context) * 0.02,
          ),
          Container(
              height: tinggi(context) * 0.07,
              child: loginButton('Check Out', abu, hitam)),
        ],
      ),
    ),
  );
}

Widget dashboard(context) {
  return Container(
    height: tinggi(context) * 0.5,
    // decoration: BoxDecoration(
    //   color: putih,
    // ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: GestureDetector(
            onTap: (() {
              navigateToNextScreen(context, Pendafataran());
            }),
            child: Column(
              children: [
                Container(
                  height: tinggi(context) * 0.2,
                  width: tinggi(context) * 0.2,
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: biru.withOpacity(0.4),
                        blurRadius: 6,
                        offset: Offset(0, 8),
                      ),
                    ],
                    color: peach,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    // shadowColor: Color.fromRGBO(237, 155, 12, 1),
                  ),
                  child: Icon(Icons.add_card,
                      color: orange, size: tinggi(context) * 0.08),
                ),
                SizedBox(
                  height: tinggi(context) * 0.02,
                ),
                Text("Pendaftaran",
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                    )),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: GestureDetector(
            onTap: (() {
              navigateToNextScreen(context, Visit());
            }),
            child: Column(
              children: [
                Container(
                  height: tinggi(context) * 0.2,
                  width: tinggi(context) * 0.2,
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: biru.withOpacity(0.4),
                        blurRadius: 6,
                        offset: Offset(0, 8),
                      ),
                    ],
                    color: peach,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    // shadowColor: Color.fromRGBO(237, 155, 12, 1),
                  ),
                  child: Icon(Icons.location_on,
                      color: Colors.orange, size: tinggi(context) * 0.1),
                ),
                SizedBox(
                  height: tinggi(context) * 0.02,
                ),
                Text("Visit",
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                    )),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget catatan(context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      padding: EdgeInsets.all(lebar(context) * 0.02),
      height: tinggi(context) * 0.35,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: orange.withOpacity(0.4),
            blurRadius: 4,
            offset: Offset(0, 5),
          ),
        ],
        color: orange,
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: Row(children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
                left: lebar(context) * 0.025, top: tinggi(context) * 0.034),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Welcome, Joko",
                      style: GoogleFonts.montserrat(
                        color: putih,
                        fontSize: 40,
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                      )),
                  Expanded(
                    child: Text(
                      "Have Nice a Day",
                      style: GoogleFonts.montserrat(
                        color: putih,
                        fontSize: 16,
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(flex: 1, child: Image.asset("assets/welcome.png"))
      ]),
    ),
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
