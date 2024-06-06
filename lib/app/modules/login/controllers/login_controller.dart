// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:my_calculator/app/modules/dashboard/views/dashboard_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginUser({required BuildContext, context}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("name", userNameController.text.trim());
    pref.setString("pass", passwordController.text.trim());
    Get.to(DashboardView());

    update();
  }
  
}
