import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transisi_app/app/data/model_login.dart';
import 'package:transisi_app/app/modules/home/views/home_view.dart';
import '../controllers/login_controller.dart';
import 'package:http/http.dart' as http;


class LoginView extends GetView<LoginController> {
  @override
  final _emailC = TextEditingController();
  final _passwordC = TextEditingController();
  String _baseUrl = ('https://reqres.in/api/login');

  void _login() async {
    if (_emailC.text.isEmpty && _passwordC.text.isEmpty) {
      var response = await http.post(Uri.parse(_baseUrl),
          body: {'email': _emailC.text, 'password': _passwordC.text});
      if (response.statusCode == 200) {
        Get.off(HomeView());
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: context.width,
          height: context.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF009D7B),
                Color(0xFFE8F5E9),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                ),
                Container(
                    height: Get.height * 0.3,
                    child: Image.asset(
                      "assets/logo/logo_2.png",
                      fit: BoxFit.contain,
                    )),
                Container(
                  //color: Colors.amber,
                  height: Get.height * 0.2,
                  width: Get.width,
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: _emailC,
                            decoration: InputDecoration(
                                label: Text(
                                  "Email",
                                  style: TextStyle(color: Colors.black),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide:
                                        BorderSide(color: Colors.green)),
                                prefixIcon: Icon(
                                  Icons.mail_outline_rounded,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: _passwordC,
                            obscureText: true,
                            decoration: InputDecoration(
                                label: Text(
                                  "Password",
                                  style: TextStyle(color: Colors.black),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide:
                                        BorderSide(color: Colors.green)),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                               ),
                          ),
                        ),
                      ],
                    ),
                    semanticContainer: true,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    elevation: 5,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: Container(
                    height: 50,
                    width: 250,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Color(0xff36CCCA),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(2, 4),
                            blurRadius: 5,
                            spreadRadius: 2)
                      ],
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  //onTap: cekLogin,
                  onTap: () {
                    Get.off(HomeView());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
