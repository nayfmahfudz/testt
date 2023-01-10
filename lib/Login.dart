import 'package:flutter/material.dart';
import 'package:testt/component/fom.dart';
import 'package:testt/menu.dart';
import 'package:testt/setting.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  var namaController = new TextEditingController();
  var passwordController = new TextEditingController();
  var hide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          children: [
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 3,
              child: Center(
                child: Form(
                    key: formKey,
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: tinggi(context) * 0.10),
                      children: <Widget>[
                        SizedBox(height: 24.0),
                        nama(namaController, context),
                        SizedBox(height: 8.0),
                        password(passwordController, hide),
                        SizedBox(height: 24.0),
                        GestureDetector(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                if (namaController.text == "admin" &&
                                    passwordController.text == "admin") {
                                  navigateToNextScreen(context, Menu());
                                } else {
                                  berhasil(context, "Username/Password Salah");
                                }
                              }
                            },
                            child: loginButton('Log In', biru, putih)),
                        SizedBox(height: 8.0),
                        text("Belum punya akun?", () {}),
                      ],
                    )),
              ),
            ),
            Expanded(flex: 1, child: Container()),
          ],
        ));
  }
}
