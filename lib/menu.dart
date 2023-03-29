import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testt/Visit.dart';
import 'package:testt/component/fom.dart';
import 'package:testt/pendaftaran.dart';
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
      backgroundColor: abu,

      body: Column(
        children: [catatan(context), dashboard(context)],
      ),
      // bottomNavigationBar: bottomNavBar(context),
    );
  }
}

Widget dashboard(context) {
  return Container(
    height: tinggi(context) * 0.5,
    // decoration: BoxDecoration(
    //   color: putih,
    // ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: lebar(context) * 0.06,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: GestureDetector(
              onTap: (() {
                navigateToNextScreen(context, Pendafataran());
              }),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: biru.withOpacity(0.4),
                      blurRadius: 6,
                      offset: Offset(0, 8),
                    ),
                  ],
                  color: birumuda,
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  // shadowColor: Color.fromRGBO(237, 155, 12, 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FrinoIcons.f_edit,
                        color: Colors.grey, size: tinggi(context) * 0.2),
                    SizedBox(
                      height: tinggi(context) * 0.04,
                    ),
                    Text("Pendaftaran",
                        style: GoogleFonts.josefinSans(
                          textStyle: Theme.of(context).textTheme.bodySmall,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: lebar(context) * 0.16,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: GestureDetector(
              onTap: (() {
                navigateToNextScreen(context, Visit());
              }),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: biru.withOpacity(0.4),
                      blurRadius: 6,
                      offset: Offset(0, 8),
                    ),
                  ],
                  color: birumuda,
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  // shadowColor: Color.fromRGBO(237, 155, 12, 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FrinoIcons.f_mark,
                        color: Colors.red[300], size: tinggi(context) * 0.2),
                    SizedBox(
                      height: tinggi(context) * 0.04,
                    ),
                    Text("Visit",
                        style: GoogleFonts.josefinSans(
                          textStyle: Theme.of(context).textTheme.bodySmall,
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: lebar(context) * 0.06,
        ),
      ],
    ),
  );
}

Widget catatan(context) {
  return Container(
    height: tinggi(context) * 0.45,
    decoration: BoxDecoration(
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.green.withOpacity(0.4),
          blurRadius: 4,
          offset: Offset(0, 5),
        ),
      ],
      color: Color.fromARGB(255, 129, 199, 132),
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35.0),
          bottomRight: Radius.circular(35.0)),
    ),
    child: Row(children: [
      Padding(
        padding: const EdgeInsets.only(left: 60.0, top: 45),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: putih,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  // shadowColor: Color.fromRGBO(237, 155, 12, 1),
                ),
                height: lebar(context) * 0.15,
                width: lebar(context) * 0.15,
                child: Center(child: Text("Foto")),
              ),
            ],
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(
              left: lebar(context) * 0.014, top: tinggi(context) * 0.094),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text("Nama : Joko",
                      style: GoogleFonts.josefinSans(
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                      )),
                ),
                // SizedBox(
                //   height: tinggi(context) * 0.001,
                // ),
                Expanded(
                  child: Text(
                    "Jabatan  : Sales ",
                    style: GoogleFonts.josefinSans(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
                // SizedBox(
                //   height: tinggi(context) * 0.004,
                // ),
                Expanded(
                  child: Text(
                    "Status : Berkunjung",
                    style: GoogleFonts.josefinSans(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
                // SizedBox(
                //   height: tinggi(context) * 0.004,
                // ),
                Expanded(
                  child: Text(
                    "Keterangan  : ",
                    style: GoogleFonts.josefinSans(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
                // SizedBox(
                //   height: tinggi(context) * 0.004,
                // ),
                Container(
                    height: tinggi(context) * 0.09,
                    width: lebar(context) * 0.25,
                    child: loginButton('Absen Masuk', biru, putih)),
                SizedBox(
                  height: tinggi(context) * 0.029,
                ),
              ],
            ),
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 45.0, top: 45),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    height: tinggi(context) * 0.1,
                    width: lebar(context) * 0.25,
                    child: loginButton('Check Out', merah, putih)),
                SizedBox(
                  height: tinggi(context) * 0.044,
                ),
                Expanded(
                  child: Text(
                    "Visit ",
                    style: GoogleFonts.josefinSans(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Toko  : Makmur Jaya ",
                    style: GoogleFonts.josefinSans(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Owner : Sulistyo",
                    style: GoogleFonts.josefinSans(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
                SizedBox(
                  height: tinggi(context) * 0.02,
                ),
              ],
            ),
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
