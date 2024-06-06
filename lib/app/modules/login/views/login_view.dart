// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_calculator/app/consts/colors.dart';
import 'package:my_calculator/app/consts/contant.dart';
import 'package:my_calculator/app/consts/widgets.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController logcontroller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: Colorconsts.myblack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: logcontroller.userNameController,
              decoration: InputDecoration(
                prefixIcon: Themes.usericon,
                label: Text("Username"),
                fillColor: Colorconsts.mygrey,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Themes.height1,
            TextFormField(
              controller: logcontroller.passwordController,
              decoration: InputDecoration(
                prefixIcon: Themes.passicon,
                label: Text("Password"),
                fillColor: Colorconsts.mygrey,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Themes.height2,
            TextButton(
              onPressed: () async {
                if ((Costants.username ==
                        logcontroller.userNameController.text) &&
                    (Costants.password ==
                        logcontroller.passwordController.text)) {
                  logcontroller.loginUser(BuildContext: context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(seconds: 4),
                      content: Text("Invalid Username or Password")));
                }
              },
              child: Text(
                "Login",
                style: Themes.normal2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
