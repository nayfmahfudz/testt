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

  var namaController = TextEditingController();
  var namaTokoController = new TextEditingController();
  var alamatTokoController = new TextEditingController();
  var alamatController = new TextEditingController();
  var emailController = new TextEditingController();
  var teleponController = new TextEditingController();
  var passwordController = new TextEditingController();
  var repasswordController = new TextEditingController();
  var kotaController = Map<String, dynamic>();
  var KecamatanController = Map<String, dynamic>();
  var KelurahanController = Map<String, dynamic>();
  var ProvinsiController = Map<String, dynamic>();
  final formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: form(context),
      ),
    );
  }

  Widget form(context) {
    return Container(
      child: Form(
        key: formKey,
        child: ListView(
          physics: ScrollPhysics(),
          padding: EdgeInsets.only(top: lebar(context) * 0.053),
          shrinkWrap: true,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: lebar(context) * 0.053,
                ),
                Expanded(
                  child: ListView(shrinkWrap: true, children: [
                    Text(
                      "Pendaftaran Pelanggan",
                      style: TextStyle(
                          color: biru,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: tinggi(context) * 0.053,
                    ),
                    formfield(
                        namaController,
                        context,
                        "Nama",
                        Icons.account_box,
                        Icons.account_box,
                        false,
                        false, (value) {
                      if (value != null && value.length < 3)
                        return 'Harus diisi minimal 3 kata';
                      else
                        return null;
                    }),
                    SizedBox(
                      height: tinggi(context) * 0.04,
                    ),
                    formfield(
                        namaTokoController,
                        context,
                        "Nama Toko",
                        Icons.account_balance,
                        Icons.account_balance,
                        false,
                        false, (value) {
                      if (value != null && value.length < 3)
                        return 'Harus diisi minimal 3 kata';
                      else
                        return null;
                    }),
                    SizedBox(
                      height: tinggi(context) * 0.04,
                    ),
                    formfield(
                        alamatController,
                        context,
                        "Alamat",
                        Icons.account_balance,
                        Icons.account_balance,
                        false,
                        false, (value) {
                      if (value != null && value.length < 3)
                        return 'Harus diisi minimal 3 kata';
                      else
                        return null;
                    }),
                    SizedBox(
                      height: tinggi(context) * 0.04,
                    ),
                    formfield(
                        alamatTokoController,
                        context,
                        "Alamat Toko",
                        Icons.account_balance,
                        Icons.account_balance,
                        false,
                        false, (value) {
                      if (value != null && value.length < 3)
                        return 'Harus diisi minimal 3 kata';
                      else
                        return null;
                    }),
                    SizedBox(
                      height: tinggi(context) * 0.04,
                    ),
                    formfield(emailController, context, "E-mail", Icons.mail,
                        Icons.mail, false, false, (value) {
                      if (value != null && value.length < 3)
                        return 'Harus diisi minimal 3 kata';
                      else
                        return null;
                    }),
                    SizedBox(
                      height: tinggi(context) * 0.04,
                    ),
                    formfield(teleponController, context, "Telepon",
                        Icons.phone, Icons.phone, false, false, angka: true,
                        (value) {
                      if (value != null && value.length < 3)
                        return 'Harus diisi minimal 3 kata';
                      else
                        return null;
                    }),
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
                    formfield(
                        passwordController,
                        context,
                        "Password",
                        Icons.visibility,
                        Icons.visibility_off,
                        false,
                        true, (value) {
                      if (value.length > 5 &&
                          repasswordController.text != passwordController.text)
                        return 'Password Tidak sama atau kurang dari 5';
                      else
                        return null;
                    }),
                    SizedBox(
                      height: tinggi(context) * 0.04,
                    ),
                    formfield(
                        repasswordController,
                        context,
                        "Ulangi Password",
                        Icons.visibility,
                        Icons.visibility_off,
                        false,
                        true, (value) {
                      if (value.length < 5 &&
                          repasswordController.text != passwordController.text)
                        return 'Password Tidak sama atau kurang dari 5';
                      else
                        return null;
                    }),
                    SizedBox(
                      height: tinggi(context) * 0.04,
                    ),
                    dropdown(ProvinsiController, context, Provinsi,
                        Icons.location_city, "Provinsi", ((value) {
                      setState(() {
                        ProvinsiController = value;
                        kabkota(context, value["id"]).then((newvalue) {
                          setState(() {
                            Kota = newvalue ?? [];
                            Kecamatan = [];
                            Kelurahan = [];
                            kotaController = newvalue[0];
                            KecamatanController = {};
                            KelurahanController = {};
                          });
                        });
                      });
                    })),
                    SizedBox(
                      height: tinggi(context) * 0.04,
                    ),
                    dropdown(kotaController, context, Kota, Icons.location_city,
                        "Kota", ((value) {
                      setState(() {
                        kotaController = value;
                        kecamatan(context, value["id"]).then((newvalue) {
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
                        KecamatanController = value;
                        kelurahan(context, value["id"]).then((newvalue) {
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
                      setState(() {
                        KelurahanController = value;
                      });
                    })),
                  ]),
                ),
                SizedBox(
                  width: lebar(context) * 0.053,
                ),
              ],
            ),
            SizedBox(
              height: tinggi(context) * 0.1,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(
                  right: lebar(context) * 0.053,
                ),
                child: GestureDetector(
                  onTap: (() {
                    if (formKey.currentState!.validate()) {
                      daftar(
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
                              alamatController,
                              context)
                          .then((value) {
                        if (value == true) {
                          namaController.text = "";
                          namaTokoController.text = "";
                          alamatTokoController.text = "";
                          emailController.text = "";
                          teleponController.text = "";
                          passwordController.text = "";
                        }
                      });
                    }
                  }),
                  child: Container(
                      height: tinggi(context) * 0.11,
                      width: lebar(context) * 0.3,
                      child: loginButton(
                          'Submit', Color.fromARGB(255, 129, 199, 132), hitam)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
