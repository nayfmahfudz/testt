import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:testt/setting.dart';

import 'component/fom.dart';

class Pendafataran extends StatefulWidget {
  const Pendafataran({super.key});

  @override
  State<Pendafataran> createState() => _PendafataranState();
}

class _PendafataranState extends State<Pendafataran> {
  @override
  //  absen(String absen) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await Geolocator.requestPermission();
  //   permission = await Geolocator.checkPermission();
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (nipText.text == "") {
  //     callBackNip();
  //   } else if (!serviceEnabled) {
  //     berhasil(context, "Izin Location Ditolak");
  //   } else {
  //     Position position = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.high);

  //     await _picker
  //         .pickImage(source: ImageSource.camera)
  //         .then((value) => {value != null ? photo = value : null});
  //     photo != null
  //         ? uploadImage(File(photo.path), position.latitude.toString(),
  //                 position.longitude.toString(), outputnip, absen)
  //             .then((value) => {
  //                   if (value["success"] == true)
  //                     {berhasil(context, value["message"])}
  //                   else
  //                     {berhasil(context, value)}
  //                 })
  //         : null;
  //     photo = null;
  //   }
  // }
  Future daftar() async {
    try {
      await Geolocator.requestPermission();
      var permission = await Geolocator.checkPermission();
      var serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        berhasil(context, "Izin Location Ditolak");
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print({
        "nama": namaController.text,
        "nama_toko": namaTokoController.text,
        "alamat_toko": alamatTokoController.text,
        "email": emailController.text,
        "telepon": teleponController.text,
        "password": passwordController.text,
        "retype_password": passwordController.text,
        "kelurahan": KelurahanController.text,
        "kecamatan": KecamatanController.text,
        "kota": kotaController.text,
        "lat": position.latitude.toString(),
        "lng": position.latitude.toString()
      });
      FormData formData = FormData.fromMap({
        "nama": namaController.text,
        "nama_toko": namaTokoController.text,
        "alamat_toko": alamatTokoController.text,
        "email": emailController.text,
        "telepon": teleponController.text,
        "password": passwordController.text,
        "retype_password": passwordController.text,
        "kelurahan": KelurahanController.text,
        "kecamatan": KecamatanController.text,
        "kota": kotaController.text,
        "lat": position.latitude.toString(),
        "lng": position.latitude.toString()
      });
      var response = await Dio().post('$url/api/sales/attendance',
          data: formData,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $key",
          }));
      print(response.data);
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } on DioError catch (e) {
      print(e);
      if (e.response?.statusCode == 400) {
        return false;
      }
    }
  }

  var namaController = new TextEditingController();
  var namaTokoController = new TextEditingController();
  var alamatTokoController = new TextEditingController();
  var emailController = new TextEditingController();
  var teleponController = new TextEditingController();
  var passwordController = new TextEditingController();
  var kotaController = new TextEditingController();
  var KecamatanController = new TextEditingController();
  var KelurahanController = new TextEditingController();
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
                  formfield(
                      kotaController, context, "Kota", Icons.location_city),
                  SizedBox(
                    height: tinggi(context) * 0.04,
                  ),
                  formfield(KecamatanController, context, "Kecamatan",
                      Icons.location_city),
                  SizedBox(
                    height: tinggi(context) * 0.04,
                  ),
                  formfield(KelurahanController, context, "Kelurahan",
                      Icons.location_city),
                ]),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: (() => daftar()),
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
