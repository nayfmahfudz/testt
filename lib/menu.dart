import 'package:flutter/material.dart';
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
      backgroundColor: putih,
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
    decoration: BoxDecoration(
      color: putih,
    ),
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
                  color: birumuda,
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  // shadowColor: Color.fromRGBO(237, 155, 12, 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.account_box_rounded,
                        color: Colors.grey, size: tinggi(context) * 0.2),
                    Text(
                      "PENDAFTARAN",
                      style: TextStyle(
                          color: hitam,
                          fontSize: 25,
                          fontWeight: FontWeight.w400),
                    ),
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
                  color: birumuda,
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  // shadowColor: Color.fromRGBO(237, 155, 12, 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on,
                        color: Colors.red[300], size: tinggi(context) * 0.2),
                    Text(
                      "Visit",
                      style: TextStyle(
                          color: hitam,
                          fontSize: 25,
                          fontWeight: FontWeight.w400),
                    ),
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
      color: biru,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35.0),
          bottomRight: Radius.circular(35.0)),
      // shadowColor: Color.fromRGBO(237, 155, 12, 1),
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
          padding: const EdgeInsets.only(left: 45.0, top: 45),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Nama : Joko",
                  style: TextStyle(
                      color: hitam, fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: tinggi(context) * 0.014,
                ),
                Text(
                  "Jabatan  : Sales ",
                  style: TextStyle(
                      color: hitam, fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: tinggi(context) * 0.014,
                ),
                Text(
                  "Status : Berkunjung",
                  style: TextStyle(
                      color: hitam, fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: tinggi(context) * 0.014,
                ),
                Text(
                  "Keterangan  : ",
                  style: TextStyle(
                      color: hitam, fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: tinggi(context) * 0.014,
                ),
                Container(
                    height: tinggi(context) * 0.09,
                    width: lebar(context) * 0.25,
                    child: loginButton('Absen Masuk',
                        Color.fromARGB(255, 129, 199, 132), hitam))
              ],
            ),
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 45.0, top: 45, bottom: 45),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    height: tinggi(context) * 0.1,
                    width: lebar(context) * 0.25,
                    child: loginButton('Check Out',
                        Color.fromARGB(255, 229, 115, 115), hitam)),
                SizedBox(
                  height: tinggi(context) * 0.014,
                ),
                Text(
                  "Visit ",
                  style: TextStyle(
                      color: hitam, fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: tinggi(context) * 0.014,
                ),
                Text(
                  "Toko  : Makmur Jaya ",
                  style: TextStyle(
                      color: hitam, fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: tinggi(context) * 0.014,
                ),
                Text(
                  "Owner : Sulistyo",
                  style: TextStyle(
                      color: hitam, fontSize: 25, fontWeight: FontWeight.w500),
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
