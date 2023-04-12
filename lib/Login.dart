import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testt/component/fom.dart';
import 'package:testt/menu.dart';
import 'package:testt/setting.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  Future Login(String email, String pass) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      FormData formData = FormData.fromMap({
        "email": email,
        "password": pass,
      });
      var response = await Dio().post('$url/api/sales/login', data: formData);
      print(response.data["data"]["user"]);
      if (response.statusCode == 200) {
        print(response.data);
        prefs.setString('user', jsonEncode(response.data["data"]["user"]));
        prefs.setString('key', response.data["data"]["token"]);
        user = response.data["data"]["user"];
        key = response.data["data"]["token"];
        return true;
      }
      error = response.data["message"];
      return false;
    } on DioError catch (e) {
      print(e);
      if (e.response?.statusCode == 400) {
        error = e.response?.data["message"];
        return false;
      }
    }
  }

  final formKey = GlobalKey<FormState>();
  var namaController = new TextEditingController();
  var passwordController = new TextEditingController();
  var hide = true;
  var error = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          children: [
            Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(height: tinggi(context) * 0.2),
                      Text("ONLINE SHOPPING",
                          style: GoogleFonts.montserrat(
                              textStyle: Theme.of(context).textTheme.bodyLarge,
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: orange)),
                      Expanded(child: Image.asset("assets/dashboard.png"))
                    ],
                  ),
                )),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(tinggi(context) * 0.07),
                child: Container(
                  decoration: BoxDecoration(
                    color: peach,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    // shadowColor: Color.fromRGBO(237, 155, 12, 1),
                  ),
                  child: Center(
                    child: Form(
                        key: formKey,
                        child: ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(tinggi(context) * 0.03),
                          children: <Widget>[
                            Center(
                              child: Text("User Login",
                                  style: GoogleFonts.montserrat(
                                      textStyle:
                                          Theme.of(context).textTheme.bodyLarge,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w600,
                                      color: orange)),
                            ),
                            SizedBox(height: tinggi(context) * 0.05),
                            nama(namaController, context),
                            SizedBox(height: tinggi(context) * 0.01),
                            password(passwordController, hide),
                            SizedBox(height: tinggi(context) * 0.05),
                            GestureDetector(
                                onTap: () {
                                  Login(namaController.text,
                                          passwordController.text)
                                      .then(
                                    (value) {
                                      if (value) {
                                        replaceToNextScreen(context, Menu());
                                      } else {
                                        alarm(context, error);
                                      }
                                    },
                                  );
                                },
                                child: loginButton('Login', orange, putih)),
                            SizedBox(height: 8.0),
                          ],
                        )),
                  ),
                ),
              ),
            ),
            // Expanded(flex: 1, child: Container()),
          ],
        ));
  }
}
