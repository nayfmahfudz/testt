import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:testt/component/api.dart';
import 'package:testt/setting.dart';

import 'component/fom.dart';

class Pendafataran extends StatefulWidget {
  const Pendafataran({super.key});

  @override
  State<Pendafataran> createState() => _PendafataranState();
}

class _PendafataranState extends State<Pendafataran> {
  @override
  void initState() {
    if (Provinsi.length == 0) {
      provinsi(context).then((value) {
        setState(() {
          Provinsi = value;
          ProvinsiController = value[0];
        });
      });
    }
    super.initState();
  }

  var namaController = new TextEditingController();
  var namaTokoController = new TextEditingController();
  var alamatTokoController = new TextEditingController();
  var emailController = new TextEditingController();
  var teleponController = new TextEditingController();
  var passwordController = new TextEditingController();
  var kotaController = Map<String, dynamic>();
  var KecamatanController = Map<String, dynamic>();
  var KelurahanController = Map<String, dynamic>();
  var ProvinsiController = Map<String, dynamic>();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(lebar(context) * 0.053),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Pendaftaran Pelanggan",
                style: TextStyle(
                    color: biru, fontSize: 25, fontWeight: FontWeight.w500),
              ),
              Expanded(child: form(context))
            ],
          ),
        ),
      ),
    );
  }

  Widget form(context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(shrinkWrap: true, children: [
                  formfield(namaController, context, "Nama", Icons.account_box),
                  SizedBox(
                    height: tinggi(context) * 0.04,
                  ),
                  formfield(namaTokoController, context, "Nama Toko",
                      Icons.account_balance),
                  SizedBox(
                    height: tinggi(context) * 0.04,
                  ),
                  formfield(alamatTokoController, context, "Alamat Toko",
                      Icons.account_balance),
                  SizedBox(
                    height: tinggi(context) * 0.04,
                  ),
                  formfield(emailController, context, "E-mail", Icons.mail),
                  SizedBox(
                    height: tinggi(context) * 0.04,
                  ),
                  formfield(teleponController, context, "Telepon", Icons.phone),
                ]),
              ),
              SizedBox(
                width: lebar(context) * 0.12,
              ),
              Expanded(
                child: ListView(shrinkWrap: true, children: [
                  SizedBox(
                    height: tinggi(context) * 0.04,
                  ),
                  formfield(passwordController, context, "Password",
                      Icons.visibility),
                  SizedBox(
                    height: tinggi(context) * 0.04,
                  ),
                  dropdown(ProvinsiController, context, Provinsi,
                      Icons.location_city, "Provinsi", ((value) {
                    kabkota(context, value).then((newvalue) {
                      setState(() {
                        Kota = newvalue ?? [];
                        Kecamatan = [];
                        Kelurahan = [];
                        kotaController = newvalue[0];
                        KecamatanController = {};
                        KelurahanController = {};
                      });
                    });
                  })),
                  SizedBox(
                    height: tinggi(context) * 0.04,
                  ),
                  dropdown(kotaController, context, Kota, Icons.location_city,
                      "Kota", ((value) {
                    setState(() {
                      kecamatan(context, value).then((newvalue) {
                        setState(() {
                          Kecamatan = newvalue ?? [];
                          Kelurahan = [];
                          KecamatanController = newvalue[0];
                          KelurahanController = {};
                        });
                      });
                    });
                  })),
                  SizedBox(
                    height: tinggi(context) * 0.04,
                  ),
                  dropdown(KecamatanController, context, Kecamatan,
                      Icons.location_city, "Kecamatan", ((value) {
                    setState(() {
                      kelurahan(context, value).then((newvalue) {
                        setState(() {
                          Kelurahan = newvalue ?? [];
                          KelurahanController = newvalue[0];
                        });
                      });
                    });
                  })),
                  SizedBox(
                    height: tinggi(context) * 0.04,
                  ),
                  dropdown(KelurahanController, context, Kelurahan,
                      Icons.location_city, "Kelurahan", ((value) {
                    setState(() {});
                  })),
                ]),
              ),
            ],
          ),
          SizedBox(
            width: lebar(context) * 0.12,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: (() => daftar(
                  namaController,
                  namaTokoController,
                  alamatTokoController,
                  emailController,
                  teleponController,
                  passwordController,
                  ProvinsiController["nama"],
                  KelurahanController["nama"],
                  KecamatanController["nama"],
                  kotaController["nama"],
                  context)),
              child: Container(
                  height: tinggi(context) * 0.11,
                  width: lebar(context) * 0.3,
                  child: loginButton(
                      'Submit', Color.fromARGB(255, 129, 199, 132), hitam)),
            ),
          ),
        ],
      ),
    );
  }
}
