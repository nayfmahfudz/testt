import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:testt/component/fom.dart';
import 'package:testt/setting.dart';

Future provinsi(BuildContext context) async {
  try {
    var response = await Dio().get('$url/api/provinsi',
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $key",
        }));
    print(response.data);
    if (response.statusCode == 200) {
      return response.data;
    }
    return false;
  } on DioError catch (e) {
    print(e);
    if (e.response?.statusCode == 400) {
      return false;
    }
  }
}

Future kabkota(BuildContext context, idprov) async {
  try {
    var response = await Dio().get('$url/api/kabkota/${idprov}',
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $key",
        }));
    print(response.data);
    if (response.statusCode == 200) {
      return response.data;
    }
    return false;
  } on DioError catch (e) {
    print(e);
    if (e.response?.statusCode == 400) {
      return false;
    }
  }
}

Future kecamatan(BuildContext context, idkota) async {
  try {
    var response = await Dio().get('$url/api/kecamatan/${idkota}',
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $key",
        }));
    print(response.data);
    if (response.statusCode == 200) {
      return response.data;
    }
    return false;
  } on DioError catch (e) {
    print(e);
    if (e.response?.statusCode == 400) {
      return false;
    }
  }
}

Future kelurahan(BuildContext context, String idkecamatan) async {
  try {
    var response = await Dio().get('$url/api/kelurahan/${idkecamatan}',
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $key",
        }));
    print(response.data);
    if (response.statusCode == 200) {
      return response.data;
    }
    return false;
  } on DioError catch (e) {
    print(e);
    if (e.response?.statusCode == 400) {
      return false;
    }
  }
}

Future daftar(
    TextEditingController namaController,
    TextEditingController namaTokoController,
    TextEditingController alamatTokoController,
    TextEditingController emailController,
    TextEditingController teleponController,
    TextEditingController passwordController,
    String ProvinsiController,
    String KelurahanController,
    String KecamatanController,
    String kotaController,
    BuildContext context) async {
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
      "kelurahan": KelurahanController,
      "kecamatan": KecamatanController,
      "kota": kotaController,
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
      "kelurahan": KelurahanController,
      "kecamatan": KecamatanController,
      "kota": kotaController,
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
