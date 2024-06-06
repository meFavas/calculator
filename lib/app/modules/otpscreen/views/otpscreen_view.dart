// ignore_for_file: use_super_parameters, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_calculator/app/consts/colors.dart';
import 'package:my_calculator/app/consts/widgets.dart';

import '../controllers/otpscreen_controller.dart';

class OtpscreenView extends GetView<OtpscreenController> {
  const OtpscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final OtpscreenController otpscontroller = Get.put(OtpscreenController());
    final String verificationId = Get.arguments;
    return Scaffold(
      backgroundColor: Colorconsts.myblack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Themes.arrowback,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Enter Your OTP",
                style: Themes.heading1,
              ),
            ),
            Themes.height2,
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: Colorconsts.mygrey,
                filled: true,
                label: Text("Enter OTP Here"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Themes.height2,
            InkWell(
              onTap: () {
                otpscontroller.verifyOtp(verificationId);
              },
              child: Container(
                height: 60,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colorconsts.myorange),
                child: Center(
                  child: Text(
                    "Login",
                    style: Themes.normal,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
