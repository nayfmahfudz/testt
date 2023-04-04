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
          Text("JOKO",
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                textStyle: Theme.of(context).textTheme.bodyLarge,
              )),
          SizedBox(
            height: tinggi(context) * 0.015,
          ),
          Text("Sales",
              style: GoogleFonts.montserrat(
                fontSize: 20,
                textStyle: Theme.of(context).textTheme.bodyLarge,
              )),
          SizedBox(
            height: tinggi(context) * 0.015,
          ),
          Container(
              height: tinggi(context) * 0.07,
              child: loginButton('Berkunjung', hijau, putih)),
          SizedBox(
            height: tinggi(context) * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Masuk : 08.00",
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                  )),
              Text("Masuk : 15.00",
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                  )),
            ],
          ),
          SizedBox(
            height: tinggi(context) * 0.007,
          ),
          Container(
              height: tinggi(context) * 0.07,
              child: loginButton('Absen Masuk', biru, putih)),
          SizedBox(
            height: tinggi(context) * 0.015,
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
                    color: birumuda,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    // shadowColor: Color.fromRGBO(237, 155, 12, 1),
                  ),
                  child: Icon(Icons.add_box,
                      color: Colors.grey, size: tinggi(context) * 0.08),
                ),
                SizedBox(
                  height: tinggi(context) * 0.02,
                ),
                Text("Pendaftaran",
                    style: GoogleFonts.montserrat(
                      textStyle: Theme.of(context).textTheme.bodySmall,
                    )),
              ],
            ),
          ),
        ),
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
                    color: birumuda,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    // shadowColor: Color.fromRGBO(237, 155, 12, 1),
                  ),
                  child: Icon(Icons.location_on,
                      color: Colors.grey, size: tinggi(context) * 0.08),
                ),
                SizedBox(
                  height: tinggi(context) * 0.02,
                ),
                Text("Visit",
                    style: GoogleFonts.montserrat(
                      textStyle: Theme.of(context).textTheme.bodySmall,
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
        //   Padding(
        //     padding: const EdgeInsets.only(left: 60.0, top: 45),
        //     child: Container(
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         children: [
        //           Container(
        //             decoration: BoxDecoration(
        //               color: putih,
        //               borderRadius: BorderRadius.all(Radius.circular(10.0)),
        //               // shadowColor: Color.fromRGBO(237, 155, 12, 1),
        //             ),
        //             height: lebar(context) * 0.15,
        //             width: lebar(context) * 0.15,
        //             child: Center(child: Text("Foto")),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        //   Expanded(
        //     child: Padding(
        //       padding: EdgeInsets.only(
        //           left: lebar(context) * 0.014, top: tinggi(context) * 0.094),
        //       child: Container(
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           children: [
        //             Expanded(
        //               child: Text("Nama : Joko",
        //                   style: GoogleFonts.josefinSans(
        //                     textStyle: Theme.of(context).textTheme.bodyLarge,
        //                   )),
        //             ),
        //             // SizedBox(
        //             //   height: tinggi(context) * 0.001,
        //             // ),
        //             Expanded(
        //               child: Text(
        //                 "Jabatan  : Sales ",
        //                 style: GoogleFonts.josefinSans(
        //                   textStyle: Theme.of(context).textTheme.bodyLarge,
        //                 ),
        //               ),
        //             ),
        //             // SizedBox(
        //             //   height: tinggi(context) * 0.004,
        //             // ),
        //             Expanded(
        //               child: Text(
        //                 "Status : Berkunjung",
        //                 style: GoogleFonts.josefinSans(
        //                   textStyle: Theme.of(context).textTheme.bodyLarge,
        //                 ),
        //               ),
        //             ),
        //             // SizedBox(
        //             //   height: tinggi(context) * 0.004,
        //             // ),
        //             Expanded(
        //               child: Text(
        //                 "Keterangan  : ",
        //                 style: GoogleFonts.josefinSans(
        //                   textStyle: Theme.of(context).textTheme.bodyLarge,
        //                 ),
        //               ),
        //             ),
        //             // SizedBox(
        //             //   height: tinggi(context) * 0.004,
        //             // ),
        //             Container(
        //                 height: tinggi(context) * 0.09,
        //                 width: lebar(context) * 0.25,
        //                 child: loginButton('Absen Masuk', biru, putih)),
        //             SizedBox(
        //               height: tinggi(context) * 0.029,
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        //   Expanded(
        //     child: Padding(
        //       padding: const EdgeInsets.only(left: 45.0, top: 45),
        //       child: Container(
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           children: [
        //             Container(
        //                 height: tinggi(context) * 0.1,
        //                 width: lebar(context) * 0.25,
        //                 child: loginButton('Check Out', merah, putih)),
        //             SizedBox(
        //               height: tinggi(context) * 0.044,
        //             ),
        //             Expanded(
        //               child: Text(
        //                 "Visit ",
        //                 style: GoogleFonts.josefinSans(
        //                   textStyle: Theme.of(context).textTheme.bodyLarge,
        //                 ),
        //               ),
        //             ),
        //             Expanded(
        //               child: Text(
        //                 "Toko  : Makmur Jaya ",
        //                 style: GoogleFonts.josefinSans(
        //                   textStyle: Theme.of(context).textTheme.bodyLarge,
        //                 ),
        //               ),
        //             ),
        //             Expanded(
        //               child: Text(
        //                 "Owner : Sulistyo",
        //                 style: GoogleFonts.josefinSans(
        //                   textStyle: Theme.of(context).textTheme.bodyLarge,
        //                 ),
        //               ),
        //             ),
        //             SizedBox(
        //               height: tinggi(context) * 0.02,
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   )
        //
        //
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
