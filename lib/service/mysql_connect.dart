import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';

//import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'connect_server.dart';

class MysqlCrud {
  static Future ServerConect(
      serverIP, BuildContext context, GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      var response = await http.post(
          Uri.parse(
              "http://192.168.43.99:8012/educational_platform/auth/login.php"),
          body: {
            "username": serverIP.text,
          });
      var data = json.decode(response.body);
      if (data.toString() == "Success") {
        print('Success');
        /*Fluttertoast.showToast(
          msg: 'تم تسجيل الدخول بنجاح',
          backgroundColor: Colors.green,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );*/
        Navigator.pushReplacement(context,
            CupertinoPageRoute(builder: (context) => const ConnectServer()));
      } else {
        /* Fluttertoast.showToast(
          backgroundColor: Colors.red,
          textColor: Colors.white,
          msg: 'اسم المستخدم أو كلمة المرور غير صحيحة',
          toastLength: Toast.LENGTH_SHORT,
        );*/
      }
    }
  }
}
