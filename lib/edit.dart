import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:testt/component/api.dart';
import 'package:testt/setting.dart';

import 'component/fom.dart';

class Edit extends StatefulWidget {
  Edit(this.data);
  Map data = {};

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  void initState() {
    namaController.text = widget.data["nama"].toString();
    namaTokoController.text = widget.data["nama_toko"].toString();
    alamatTokoController.text = widget.data["alamat_toko"].toString();
    emailController.text = widget.data["email"].toString();
    teleponController.text = widget.data["telepon"].toString();
    print(widget.data["provinsi"]);
    if (Provinsi.length == 0) {
      provinsi(context).then((value) {
        setState(() {
          Provinsi = value;
          print(value);
          Provinsi.forEach((item) {
            print(item);
            if (item["provinsi"] == widget.data["provinsi"]) {
              ProvinsiController = item;
              kabkota(context, item["id"]).then((value) {
                value.forEach((item) {
                  if (item["nama"] == widget.data["kota"]) {
                    print(item);
                    kotaController = item;
                    kecamatan(context, item["id"]).then((value) {
                      value.forEach((item) {
                        if (item["nama"] == widget.data["kecamatan"]) {
                          print(item);
                          KecamatanController = item;
                          kelurahan(context, item["id"]).then((value) {
                            value.forEach((item) {
                              if (item["nama"] == widget.data["kelurahan"]) {
                                print(item);
                                KelurahanController = item;
                              }
                            });
                          });
                        }
                      });
                    });
                  }
                });
              });
            }
          });
        });
      });
    }
    super.initState();
  }

  var alamatController = new TextEditingController();
  var namaController = new TextEditingController();
  var namaTokoController = new TextEditingController();
  var alamatTokoController = new TextEditingController();
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
          shrinkWrap: true,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: lebar(context) * 0.023,
                  left: lebar(context) * 0.053,
                  right: lebar(context) * 0.053,
                  bottom: lebar(context) * 0.053),
              child: Text(
                "Edit Pelanggan",
                style: TextStyle(
                    color: biru, fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: lebar(context) * 0.053),
                Expanded(
                  child: ListView(shrinkWrap: true, children: [
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
                      if (value.length < 5 &&
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
                SizedBox(width: lebar(context) * 0.053),
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
                      edit(
                          widget.data["id"].toString(),
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
                          context);
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
            SizedBox(
              height: tinggi(context) * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
